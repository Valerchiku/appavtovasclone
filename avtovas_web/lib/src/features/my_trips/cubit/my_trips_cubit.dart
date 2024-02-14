import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  final MyTripsInteractor _myTripsInteractor;

  MyTripsCubit(this._myTripsInteractor)
      : super(
          const MyTripsState(
            upcomingStatusedTrips: [],
            finishedStatusedTrips: [],
            archiveStatusedTrips: [],
            declinedStatusedTrips: [],
            timeDifferences: {},
            currentTripsStatus: UserTripStatus.upcoming,
            paidTripUuid: '',
            paymentConfirmationUrl: '',
            shouldShowPaymentError: false,
            pageLoading: true,
            shouldShowLoadingAnimation: true,
            paymentObject: null,
            shouldShowTranslucentLoadingAnimation: false,
            allTrips: [],
          ),
        ) {
    _initPage();
  }

  final _router = AppRouter.appRouter;

  StreamSubscription<User>? _userSubscription;

  Timer? _timer;

  var _cubitWasClose = false;

  String get firstUserEmail => _myTripsInteractor.userEmail;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;

    _timer?.cancel();
    _timer = null;

    _cubitWasClose = true;

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

  void updateCurrentTripsStatus(UserTripStatus tripStatus) {
    emit(
      state.copyWith(currentTripsStatus: tripStatus),
    );
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
      state.copyWith(shouldShowTranslucentLoadingAnimation: true),
    );

    final refundDate = await TimeReceiver.fetchUnifiedTime();

    final refundCostAmount = RefundCostHandler.calculateRefundCostAmount(
      tripCost: tripCost,
      departureDate: departureDate,
      refundDate: refundDate,
    );

    final refundStatus = await _myTripsInteractor.refundTicket(
      dbName: dbName,
      paymentId: paymentId,
      refundCostAmount: refundCostAmount,
    );

    if (refundStatus == PaymentStatuses.succeeded) {
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
            state.copyWith(shouldShowTranslucentLoadingAnimation: false),
          );

          return;
        }

        returnTicketNumbers.add(returnTicketNumber);
      }

      for (final ticketNumber in returnTicketNumbers) {
        await _myTripsInteractor.oneCReturnPayment(
          dbName: refundedTrip.tripDbName,
          returnOrderId: ticketNumber,
          amount: refundCostAmount.toString(),
        );
      }

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
        state.copyWith(shouldShowTranslucentLoadingAnimation: false),
      );
    } else {
      errorAction();

      emit(
        state.copyWith(shouldShowTranslucentLoadingAnimation: false),
      );
    }
  }

  Future<void> paymentProcessPassed({
    required String paymentId,
    required String statusedTripId,
    required VoidCallback onErrorAction,
  }) async {
    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: true),
    );

    await Future.delayed(const Duration(seconds: 2));

    final userUid = await _myTripsInteractor.fetchLocalUserUuid();

    final user = await _myTripsInteractor.fetchUser(userUid);

    final statusedTrip = user.statusedTrips!.firstWhere(
      (trip) => trip.uuid == statusedTripId,
    );

    final paymentStatus = await _myTripsInteractor.fetchPaymentStatus(
      dbName: statusedTrip.tripDbName,
      paymentId: paymentId,
    );

    if (paymentStatus == PaymentStatuses.succeeded) {
      final oneCPaymentStatus = await _myTripsInteractor.oneCPayment(
        dbName: statusedTrip.tripDbName,
        orderId: statusedTrip.orderNum!,
        amount: statusedTrip.saleCost,
      );

      if (oneCPaymentStatus == 'error') {
        onErrorAction();

        emit(
          state.copyWith(shouldShowTranslucentLoadingAnimation: false),
        );

        await _myTripsInteractor.refundTicket(
          dbName: statusedTrip.tripDbName,
          paymentId: paymentId,
          refundCostAmount: double.parse(statusedTrip.saleCost),
        );

        return;
      }

      await _myTripsInteractor.updatePaymentsHistory(
        dbName: statusedTrip.tripDbName,
        payment: Payment(
          paymentUuid: paymentId,
          paymentPrice: statusedTrip.saleCost,
          paymentDate: DateTime.now(),
          paymentDescription: 'Оплата билета',
          paymentStatus: PaymentHistoryStatus.paid.name,
        ),
      );

      await _myTripsInteractor.updateStatusedTrip(
        statusedTripId,
        userTripCostStatus: UserTripCostStatus.paid,
        paymentUuid: paymentId,
      );

      await _myTripsInteractor.insertNewNotification(
        notificationTripUuid: state.paidTripUuid,
        departureTime: statusedTrip.trip.departureTime,
      );

      emit(
        state.copyWith(shouldShowTranslucentLoadingAnimation: false),
      );
    } else {
      await _myTripsInteractor.oneCCancelPayment(
        dbName: statusedTrip.tripDbName,
        orderId: statusedTrip.orderNum!,
      );

      emit(
        state.copyWith(
          pageLoading: false,
          shouldShowLoadingAnimation: false,
          shouldShowTranslucentLoadingAnimation: false,
        ),
      );

      onErrorAction();
    }
  }

  Future<void> startPayment({
    required String value,
    required StatusedTrip statusedTrip,
    required String paymentDescription,
    required VoidCallback onErrorAction,
  }) async {
    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: true),
    );

    final confirmation = await _myTripsInteractor.generateConfirmationToken(
      dbName: statusedTrip.tripDbName,
      value: value,
    );

    final paymentId = confirmation.$1;
    final confirmationToken = confirmation.$2;

    if (paymentId != 'error_id') {
      _router
          .navigateTo(
            CustomRoute(
              RouteType.navigateTo,
              paymentConfig(
                confirmationToken: confirmationToken,
                encodedPaymentParams: '$paymentId?${statusedTrip.uuid}',
              ),
            ),
          )
          .whenComplete(
            () => emit(
              state.copyWith(shouldShowTranslucentLoadingAnimation: false),
            ),
          );
    } else {
      await _myTripsInteractor.oneCCancelPayment(
        dbName: statusedTrip.tripDbName,
        orderId: statusedTrip.orderNum!,
      );

      emit(
        state.copyWith(shouldShowTranslucentLoadingAnimation: false),
      );

      onErrorAction();
    }
  }

  Future<void> _initPage() async {
    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    final userUid = await _myTripsInteractor.fetchLocalUserUuid();

    await _myTripsInteractor.fetchUser(userUid);

    if (_cubitWasClose) return;

    emit(
      state.copyWith(nowUtc: nowUtc),
    );

    _subscribeAll();
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = null;

    if (_cubitWasClose) return;

    _userSubscription = _myTripsInteractor.userStream.listen(_onNewUser);
  }

  Future<void> _onNewUser(User user) async {
    if (user.uuid == '-1' || user.uuid == '0') return;

    emit(
      state.copyWith(allTrips: user.statusedTrips),
    );

    try {
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
    } catch (_) {
      return;
    }

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
        shouldShowLoadingAnimation: false,
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

    if (finishedTrips.isNotEmpty) {
      for (final trip in finishedTrips) {
        await updateTripStatus(
          trip.uuid,
          UserTripStatus.finished,
        );
      }
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
    if (reservedTrips == null || reservedTrips.isEmpty) return;

    final mapDifferences = <String, int>{};
    for (final trip in reservedTrips) {
      final difference =
          600 - state.nowUtc!.difference(trip.saleDate).inSeconds;
      difference <= 0
          ? _endTimerCallback(trip.uuid)
          : mapDifferences.addAll({trip.uuid: difference});
    }

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

        emit(
          state.copyWith(
            timeDifferences: Map.of(copyDurations),
          ),
        );
      },
    );
  }

  Future<void> removeFromArchive(String tripUid) async {
    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: true),
    );

    await _myTripsInteractor.removeTripFromArchive(statusedTripUid: tripUid);

    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: false),
    );
  }

  Future<void> updateTripStatus(
    String uuid, [
    UserTripStatus? userTripStatus,
    UserTripCostStatus? userTripCostStatus,
  ]) async {
    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: true),
    );

    await _myTripsInteractor.updateStatusedTrip(
      uuid,
      userTripStatus: userTripStatus,
      userTripCostStatus: userTripCostStatus,
    );

    emit(
      state.copyWith(shouldShowTranslucentLoadingAnimation: false),
    );
  }
}
