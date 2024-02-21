import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
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

  Future<void> refundTicket({
    required String dbName,
    required String paymentId,
    required String tripCost,
    required DateTime departureDate,
    required StatusedTrip refundedTrip,
    required VoidCallback errorAction,
  }) async {
    emit(
      state.copyWith(pageLoading: true),
    );

    final refundDate = await TimeReceiver.fetchUnifiedTime();

    final refundCostAmount = RefundCostHandler.calculateRefundCostAmount(
      tripCost: tripCost,
      departureDate: departureDate,
      refundDate: refundDate,
    );

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

        return;
      }

      returnTicketNumbers.add(returnTicketNumber);
    }

    for (final ticketNumber in returnTicketNumbers) {
      await _myTripsInteractor.oneCReturnPayment(
        dbName: refundedTrip.tripDbName,
        returnOrderId: ticketNumber,
        amount: tripCost,
      );
    }

    final refundStatus = await _myTripsInteractor.refundTicket(
      dbName: dbName,
      paymentId: paymentId,
      refundCostAmount: refundCostAmount,
    );

    if (refundStatus == PaymentStatuses.succeeded) {
      await _myTripsInteractor.removeNotificationBySingleTripUid(
        singleTripUid: refundedTrip.uuid,
      );

      await _myTripsInteractor.updatePaymentsHistory(
        dbName: refundedTrip.tripDbName,
        payment: Payment(
          paymentUuid: refundedTrip.paymentUuid!,
          paymentPrice: refundCostAmount.toString(),
          paymentDate: refundDate,
          paymentDescription: 'Возврат заказа №${refundedTrip.trip.routeNum}',
          paymentStatus: PaymentHistoryStatus.refund.name,
        ),
      );

      await _myTripsInteractor.updateStatusedTrip(
        refundedTrip.uuid,
        userTripStatus: UserTripStatus.declined,
        userTripCostStatus: UserTripCostStatus.declined,
        saleCost: refundCostAmount.toInt().toString(),
      );

      emit(
        state.copyWith(pageLoading: false),
      );
    } else {
      emit(
        state.copyWith(pageLoading: false),
      );
    }
  }

  Future<void> confirmProcessPassed(VoidCallback onErrorAction) async {
    emit(
      state.copyWith(paymentConfirmationUrl: '', pageLoading: true),
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

      await _myTripsInteractor.updateStatusedTrip(
        state.paidTripUuid,
        userTripCostStatus: UserTripCostStatus.paid,
        paymentUuid: state.paymentObject!.id,
      );

      emit(
        state.copyWith(pageLoading: false, transparentPageLoading: false),
      );

    } else {
      await _myTripsInteractor.oneCCancelPayment(
        dbName: paidTrip.tripDbName,
        orderId: paidTrip.orderNum!,
      );

      emit(
        state.copyWith(pageLoading: false, transparentPageLoading: false),
      );

      onErrorAction();
    }
  }

  Future<void> startPayment(
    String value,
    String paymentDescription,
    VoidCallback onErrorAction,
    String dbName,
  ) async {
    _updateTransparentPageLoadingStatus(true);

    final paidTrip = state.upcomingStatusedTrips?.firstWhere(
      (trip) => trip.uuid == state.paidTripUuid,
    );

    if (paidTrip == null) return;

    final oneCPaymentStatus = await _myTripsInteractor.oneCPayment(
      dbName: paidTrip.tripDbName,
      orderId: paidTrip.orderNum!,
      amount: paidTrip.saleCost,
    );

    if (oneCPaymentStatus == 'error') {
      onErrorAction();

      emit(
        state.copyWith(
          pageLoading: false,
          transparentPageLoading: false,
        ),
      );

      return;
    }

    final paymentObject = await _myTripsInteractor.createPaymentObject(
      dbName: dbName,
      value: value,
      paymentDescription: paymentDescription,
    );

    if (paymentObject.id != 'error') {
      emit(
        state.copyWith(paymentObject: paymentObject),
      );

      startPaymentConfirmProcess(paymentObject, onErrorAction);
    } else {
      await _myTripsInteractor.oneCCancelPayment(
        dbName: dbName,
        orderId: paidTrip.orderNum!,
      );


      emit(
        state.copyWith(pageLoading: false, transparentPageLoading: false),
      );

      onErrorAction();
    }
  }

  void startPaymentConfirmProcess(
    YookassaPayment paymentObject,
    VoidCallback onErrorAction,
  ) {
    final confirmationUrl = paymentObject.confirmation?.confirmationUrl;

    if (confirmationUrl == null) {
      confirmProcessPassed(onErrorAction);
      return;
    }

    if (confirmationUrl.isNotEmpty &&
        paymentObject.paymentMethod.type == YookassaPaymentTypes.bankCard) {
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

    emit(
      state.copyWith(pageLoading: false),
    );
  }

  Future<void> clearArchive() async {
    emit(
      state.copyWith(pageLoading: true),
    );

    await _myTripsInteractor.clearArchive();

    emit(
      state.copyWith(pageLoading: false),
    );
  }

  String getUserEmail() {
    return _myTripsInteractor.userEmail;
  }

  Future<void> _initPage() async {
    _subscribeAll();

    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    await _fetchAuthorizedUser();

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
        upcomingStatusedTrips: user.statusedTrips
            ?.where(
              (trip) => trip.tripStatus == UserTripStatus.upcoming,
            )
            .toList(),
        finishedStatusedTrips: user.statusedTrips
            ?.where(
              (trip) => trip.tripStatus == UserTripStatus.finished,
            )
            .toList(),
        archiveStatusedTrips: user.statusedTrips
            ?.where(
              (trip) => trip.tripStatus == UserTripStatus.archive,
            )
            .toList(),
        declinedStatusedTrips: user.statusedTrips
            ?.where(
              (trip) => trip.tripStatus == UserTripStatus.declined,
            )
            .toList(),
        pageLoading: false,
      ),
    );
  }

  Future<void> _updatePaidTrips(List<StatusedTrip>? trips) async {
    if (trips == null || trips.isEmpty) return;

    final finishedTrips = trips.where(
      (trip) => state.nowUtc!
          .copyWith(
            minute: state.nowUtc!.minute + 20,
          )
          .isAfter(
            DateTime.parse(trip.trip.arrivalTime),
          ),
    );

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

  void updateTripStatus(
    String uuid, [
    UserTripStatus? userTripStatus,
    UserTripCostStatus? userTripCostStatus,
  ]) {
    /*state.timeDifferences.remove(uuid);*/
    _myTripsInteractor.updateStatusedTrip(
      uuid,
      userTripStatus: userTripStatus,
      userTripCostStatus: userTripCostStatus,
    );
  }

  void _updateTransparentPageLoadingStatus([bool? status]) {
    emit(
      state.copyWith(
        transparentPageLoading: status ?? !state.transparentPageLoading,
      ),
    );
  }

  Future<User> _fetchAuthorizedUser() async {
    final userUuid = await _myTripsInteractor.fetchLocalUserUuid();

    if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
      final user = await _myTripsInteractor.fetchUser(userUuid);

      return user;
    }

    return const User.unauthorized();
  }
}
