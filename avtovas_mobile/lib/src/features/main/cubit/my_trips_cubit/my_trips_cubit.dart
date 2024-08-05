import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/pdf_generation/pdf_generation.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/yookassa_helper/payment_types.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_trips_state.dart';

typedef VoidCallback = void Function();

class MyTripsCubit extends Cubit<MyTripsState> {
  final MyTripsInteractor _myTripsInteractor;

  MyTripsCubit(
    this._myTripsInteractor,
  ) : super(
          const MyTripsState(
            upcomingStatusedTrips: [],
            finishedStatusedTrips: [],
            archiveStatusedTrips: [],
            declinedStatusedTrips: [],
            timeDifferences: {},
            paidTripUuid: '',
            paymentConfirmationUrl: '',
            route: CustomRoute(null, null),
            shouldShowPaymentError: false,
            pageLoading: true,
            transparentPageLoading: false,
            savedUserEmail: '',
          ),
        ) {
    _initPage();
  }

  final _appRouter = AppRouter.appRouter;

  var _canUpdateTrips = false;

  bool get _cubitWasClosed => isClosed;

  StreamSubscription<User>? _userSubscription;

  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;

    _userSubscription?.cancel();
    _userSubscription = null;

    return super.close();
  }

  Future<void> sendTicketMail({
    required Uint8List ticketBytes,
    required StatusedTrip trip,
  }) {
    return _myTripsInteractor.sendTicketMail(
      ticketBytes: ticketBytes,
      html: EmailTemplates.bookingConfirmation(
        fullName: trip.passengers.first.firstName,
        departureDate: trip.trip.departureTime.formatHmdM(),
        departureStation: trip.trip.departure.name,
        arrivalStation: trip.trip.destination.name,
      ),
    );
  }

  bool checkAuthorizationStatus() {
    final isAuth = _myTripsInteractor.isAuth;

    if (!_myTripsInteractor.isAuth) {
      _appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          authConfig(content: AuthorizationContent.phone),
        ),
      );
    }

    return isAuth;
  }

  void updatePaymentStatus() {
    emit(
      state.copyWith(shouldShowPaymentError: false),
    );
  }

  void setPaidTripUuid(String tripUuid) {
    emit(
      state.copyWith(paidTripUuid: tripUuid),
    );
  }

  Future<void> _yookassaRefund({
    required double refundAmount,
    required String dbName,
    required String paymentId,
    required StatusedTrip refundedTrip,
    required ValueChanged<bool> updatePageLoadingStatus,
  }) async {
    final refundDate = await TimeReceiver.fetchUnifiedTime();

    final refundStatus = await _myTripsInteractor.refundTicket(
      dbName: dbName,
      paymentId: paymentId,
      refundCostAmount: refundAmount,
    );

    if (refundStatus == PaymentStatuses.succeeded) {
      await _myTripsInteractor.removeNotificationBySingleTripUid(
        singleTripUid: refundedTrip.uuid,
      );

      await _myTripsInteractor.updatePaymentsHistory(
        dbName: refundedTrip.tripDbName,
        payment: Payment(
          paymentUuid: generateUuid(),
          paymentPrice: refundAmount.toString(),
          paymentDate: refundDate,
          paymentDescription: 'Возврат заказа №${refundedTrip.trip.routeNum}',
          paymentStatus: PaymentHistoryStatus.refund.name,
        ),
      );

      await _myTripsInteractor.updateStatusedTrip(
        refundedTrip.uuid,
        userTripStatus: UserTripStatus.declined,
        userTripCostStatus: UserTripCostStatus.declined,
        saleCost: refundAmount.toString(),
      );

      emit(
        state.copyWith(pageLoading: false),
      );

      updatePageLoadingStatus(false);
    } else {
      emit(
        state.copyWith(pageLoading: false),
      );

      updatePageLoadingStatus(false);
    }
  }

  Future<void> refundTicket({
    required String dbName,
    required String paymentId,
    required String tripCost,
    required StatusedTrip refundedTrip,
    required VoidCallback errorAction,
    required ValueChanged<bool> updatePageLoadingStatus,
  }) async {
    updatePageLoadingStatus(true);
    /* final refundCostAmount = RefundCostHandler.calculateRefundCostAmount(
      tripCost: tripCost,
      departureDate: departureDate,
      refundDate: refundDate,
    ); */

    final returnTicketNumbers = <String>[];

    for (var i = 0; i < refundedTrip.places.length; i++) {
      final place = refundedTrip.places[i];
      final ticketNumber = refundedTrip.ticketNumbers[i];

      final returnTicketNumber = await _myTripsInteractor.oneCAddTicketReturn(
        dbName: refundedTrip.tripDbName,
        ticketNumber: ticketNumber,
        seatNum: place,
        departure: refundedTrip.trip.departure.id,
      );

      if (returnTicketNumber == 'error') {
        errorAction();

        emit(
          state.copyWith(pageLoading: false),
        );

        updatePageLoadingStatus(false);

        return;
      }

      returnTicketNumbers.add(returnTicketNumber);
    }

    final refundCostAmountList = <double>[];
    for (final ticketNumber in returnTicketNumbers) {
      final refundCost = await _myTripsInteractor.oneCReturnPayment(
        dbName: refundedTrip.tripDbName,
        returnOrderId: ticketNumber,
        amount: tripCost,
      );

      if (refundCost == 'error') {
        errorAction();

        emit(state.copyWith(pageLoading: false));

        updatePageLoadingStatus(false);

        return;
      }

      refundCostAmountList.add(double.parse(refundCost));
    }

    final refundCostAmount = refundCostAmountList.reduce((a, b) => a + b);

    await _yookassaRefund(
      refundAmount: refundCostAmount,
      dbName: dbName,
      paymentId: paymentId,
      refundedTrip: refundedTrip,
      updatePageLoadingStatus: updatePageLoadingStatus,
    );
  }

  Future<void> confirmProcessPassed(
    YookassaPayment paymentObject,
    VoidCallback onErrorAction,
    ValueChanged<bool> updatePageLoadingStatus,
    VoidCallback onPaySuccess,
  ) async {
    updatePageLoadingStatus(true);

    emit(
      state.copyWith(paymentConfirmationUrl: ''),
    );

    final paidTrip = state.upcomingStatusedTrips?.firstWhere(
      (trip) => trip.uuid == state.paidTripUuid,
    );

    if (paidTrip == null) return;

    final paymentStatus = await _myTripsInteractor.fetchPaymentStatus(
      dbName: paidTrip.tripDbName,
      paymentId: state.paymentObject!.id,
    );

    if (paymentStatus == PaymentStatuses.succeeded) {
      final oneCPaymentStatus = await _myTripsInteractor.oneCPayment(
        dbName: paidTrip.tripDbName,
        orderId: paidTrip.orderNum!,
        amount: paidTrip.saleCost,
        cardNum: '${paymentObject.paymentMethod.card.first6}'
            '****${paymentObject.paymentMethod.card.last4}',
      );

      if (oneCPaymentStatus == 'error') {
        onErrorAction();

        await _yookassaRefund(
          refundAmount: double.parse(paidTrip.saleCost),
          dbName: paidTrip.tripDbName,
          paymentId: state.paymentObject!.id,
          refundedTrip: paidTrip,
          updatePageLoadingStatus: updatePageLoadingStatus,
        );

        await fetchAuthorizedUser();

        emit(
          state.copyWith(
            pageLoading: false,
            transparentPageLoading: false,
          ),
        );

        updatePageLoadingStatus(false);

        return;
      }

      await _myTripsInteractor.updateStatusedTrip(
        state.paidTripUuid,
        userTripCostStatus: UserTripCostStatus.paid,
        paymentUuid: state.paymentObject!.id,
      );

      await _myTripsInteractor.insertNewNotification(
        notificationTripUuid: state.paidTripUuid,
        departureTime: paidTrip.trip.departureTime,
      );

      await _myTripsInteractor.updatePaymentsHistory(
        dbName: paidTrip.tripDbName,
        payment: Payment(
          paymentUuid: state.paymentObject!.id,
          paymentPrice: state.paymentObject!.amount.value,
          paymentDate: state.paymentObject!.createdAt,
          paymentDescription: 'Оплата заказа №${paidTrip.trip.routeNum}',
          paymentStatus: PaymentHistoryStatus.paid.name,
        ),
      );

      final ticketBytes = await PDFGenerator.generatePdfBytesArray(
        statusedTrip: paidTrip,
        isReturnTicket: false,
      );

      sendTicketMail(ticketBytes: ticketBytes, trip: paidTrip);

      onPaySuccess();

      emit(
        state.copyWith(pageLoading: false, transparentPageLoading: false),
      );

      updatePageLoadingStatus(false);
    } else {
      await fetchAuthorizedUser();

      emit(
        state.copyWith(pageLoading: false, transparentPageLoading: false),
      );

      updatePageLoadingStatus(false);
      onErrorAction();
    }
  }

  Future<void> startPayment(
    String value,
    String paymentDescription,
    VoidCallback onErrorAction,
    String dbName,
    ValueChanged<bool> updatePageLoadingStatus,
    VoidCallback onPaySuccess,
  ) async {
    _timer?.cancel();
    _timer = null;

    updatePageLoadingStatus(true);

    final paidTrip = state.upcomingStatusedTrips?.firstWhere(
      (trip) => trip.uuid == state.paidTripUuid,
    );

    if (paidTrip == null) return;

    final paymentObject = await _myTripsInteractor.createPaymentObject(
      dbName: dbName,
      value: value,
      paymentDescription: paymentDescription,
    );

    if (paymentObject.id != 'error') {
      emit(
        state.copyWith(paymentObject: paymentObject),
      );

      startPaymentConfirmProcess(
        paymentObject,
        onErrorAction,
        updatePageLoadingStatus,
        onPaySuccess,
      );
    } else {
      await fetchAuthorizedUser();

      emit(
        state.copyWith(pageLoading: false),
      );

      updatePageLoadingStatus(false);

      onErrorAction();
    }
  }

  void startPaymentConfirmProcess(
    YookassaPayment paymentObject,
    VoidCallback onErrorAction,
    ValueChanged<bool> updatePageLoadingStatus,
    VoidCallback onPaySuccess,
  ) {
    final confirmationUrl = paymentObject.confirmation?.confirmationUrl;

    if (confirmationUrl == null) {
      confirmProcessPassed(
        paymentObject,
        onErrorAction,
        updatePageLoadingStatus,
        onPaySuccess,
      );
      return;
    }

    if (confirmationUrl.isNotEmpty &&
        paymentObject.paymentMethod.type == YookassaPaymentTypes.bankCard) {
      updatePageLoadingStatus(false);

      emit(
        state.copyWith(paymentConfirmationUrl: confirmationUrl),
      );
    }
  }

  Future<void> removeTripFromArchive(String statusedTripUid) async {
    emit(
      state.copyWith(pageLoading: true),
    );

    await _myTripsInteractor.removeTripFromArchive(
      statusedTripUid: statusedTripUid,
    );

    Future.delayed(
      const Duration(milliseconds: 300),
      () => emit(
        state.copyWith(pageLoading: false),
      ),
    );
  }

  Future<void> clearArchive() async {
    emit(
      state.copyWith(pageLoading: true),
    );

    await _myTripsInteractor.clearArchive();

    Future.delayed(
      const Duration(milliseconds: 300),
      () => emit(
        state.copyWith(pageLoading: false),
      ),
    );
  }

  Future<void> _initPage() async {
    _subscribeAll();

    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    await fetchAuthorizedUser();

    _canUpdateTrips = true;

    if (_cubitWasClosed) return;

    emit(
      state.copyWith(nowUtc: nowUtc),
    );
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = null;
    _userSubscription = _myTripsInteractor.userStream.listen(_onNewUser);
  }

  Future<void> _onNewUser(User user) async {
    if (user.uuid == '-1' || user.uuid == '0') return;

    if (_cubitWasClosed || !_canUpdateTrips) return;

    await _calculateTimeDifferences(
      user.statusedTrips
          ?.where(
            (trip) => trip.tripCostStatus == UserTripCostStatus.reserved,
          )
          .toList(),
    );

    await _updatePaidTrips(
      user.statusedTrips
          ?.where(
            (trip) =>
                trip.tripCostStatus == UserTripCostStatus.paid &&
                trip.tripStatus == UserTripStatus.upcoming,
          )
          .toList(),
    );

    if (_cubitWasClosed) return;

    emit(
      state.copyWith(
        savedUserEmail: _myTripsInteractor.userEmail,
        upcomingStatusedTrips: user.statusedTrips
                ?.where(
                  (trip) => trip.tripStatus == UserTripStatus.upcoming,
                )
                .toList() ??
            [],
        finishedStatusedTrips: user.statusedTrips
                ?.where(
                  (trip) => trip.tripStatus == UserTripStatus.finished,
                )
                .toList() ??
            [],
        archiveStatusedTrips: user.statusedTrips
                ?.where(
                  (trip) => trip.tripStatus == UserTripStatus.archive,
                )
                .toList() ??
            [],
        declinedStatusedTrips: user.statusedTrips
                ?.where(
                  (trip) => trip.tripStatus == UserTripStatus.declined,
                )
                .toList() ??
            [],
        pageLoading: false,
      ),
    );
  }

  Future<void> _updatePaidTrips(List<StatusedTrip>? trips) async {
    if (trips == null || trips.isEmpty) return;

    final finishedTrips = [
      ...trips.where(
        (trip) => state.nowUtc!
            .copyWith(
              minute: state.nowUtc!.minute + 20,
            )
            .isAfter(
              DateTime.parse(trip.trip.departureTime).copyWith(
                hour: DateTime.parse(trip.trip.departureTime).hour + 4,
              ),
            ),
      ),
    ];

    for (final trip in finishedTrips) {
      updateTripStatus(
        trip.uuid,
        UserTripStatus.finished,
      );
    }
  }

  void _endTimerCallback(String tripUuid) {
    _myTripsInteractor.updateStatusedTrip(
      tripUuid,
      userTripStatus: UserTripStatus.archive,
      userTripCostStatus: UserTripCostStatus.expiredReverse,
    );
  }

  Future<void> _calculateTimeDifferences(
    List<StatusedTrip>? reservedTrips,
  ) async {
    if (reservedTrips == null || _cubitWasClosed) return;

    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    final mapDifferences = <String, int>{};
    for (final trip in reservedTrips) {
      final difference = 600 - nowUtc.difference(trip.saleDate).inSeconds;
      difference <= 0
          ? _endTimerCallback(trip.uuid)
          : mapDifferences.addAll({trip.uuid: difference});
    }

    if (_cubitWasClosed) return;

    emit(
      state.copyWith(timeDifferences: mapDifferences),
    );

    _startTimer(mapDifferences);
  }

  void _startTimer(Map<String, int> durations) {
    if (durations.isEmpty) return;

    final copyDurations = Map<String, int>.from(durations);

    _timer?.cancel();
    _timer = null;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (durations.isEmpty) _timer?.cancel();

        for (final key in copyDurations.keys) {
          final seconds = copyDurations[key];
          if (seconds == 0) {
            _endTimerCallback(key);
            copyDurations.remove(key);
          } else {
            copyDurations[key] = seconds! - 1;
          }
        }

        if (_cubitWasClosed) return;

        emit(
          state.copyWith(
            timeDifferences: Map.of(copyDurations),
          ),
        );
      },
    );
  }

  Future<void> updateTripStatus(
    String uuid, [
    UserTripStatus? userTripStatus,
    UserTripCostStatus? userTripCostStatus,
  ]) async {
    emit(
      state.copyWith(pageLoading: true),
    );

    await _myTripsInteractor.updateStatusedTrip(
      uuid,
      userTripStatus: userTripStatus,
      userTripCostStatus: userTripCostStatus,
    );

    Future.delayed(
      const Duration(milliseconds: 300),
      () => emit(
        state.copyWith(pageLoading: false),
      ),
    );
  }

  Future<void> fetchAuthorizedUser() async {
    final userUuid = await _myTripsInteractor.fetchLocalUserUuid();

    if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
      await _myTripsInteractor.fetchUser(userUuid);
    }
  }
}
