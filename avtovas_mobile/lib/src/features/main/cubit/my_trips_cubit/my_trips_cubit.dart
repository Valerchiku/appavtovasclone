import 'dart:async';

import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/yookassa_helper/payment_types.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';
import 'package:equatable/equatable.dart';
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
            shouldShowPaymentError: false,
            pageLoading: true,
          ),
        ) {
    _initPage();
  }

  var _canUpdateTrips = false;

  bool get _cubitWasClosed => isClosed;

  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;

    return super.close();
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

    final refundStatus = await _myTripsInteractor.refundTicket(
      dbName: dbName,
      paymentId: paymentId,
      refundCostAmount: refundCostAmount,
    );

    if (refundStatus == PaymentStatuses.succeeded) {
      await _myTripsInteractor.updatePaymentsHistory(
        dbName: refundedTrip.tripDbName,
        payment: Payment(
          paymentUuid: refundedTrip.paymentUuid!,
          paymentPrice: refundCostAmount.toString(),
          paymentDate: refundDate,
          paymentDescription: 'Возврат заказа №${refundedTrip.trip.routeNum}',
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
      await _myTripsInteractor.updatePaymentsHistory(
        dbName: paidTrip.tripDbName,
        payment: Payment(
          paymentUuid: state.paymentObject!.id,
          paymentPrice: state.paymentObject!.amount.value,
          paymentDate: state.paymentObject!.createdAt,
          paymentDescription: 'Оплата заказа №${paidTrip.trip.routeNum}',
        ),
      );

      await _myTripsInteractor.updateStatusedTrip(
        state.paidTripUuid,
        userTripCostStatus: UserTripCostStatus.paid,
        paymentUuid: state.paymentObject!.id,
      );

      emit(
        state.copyWith(pageLoading: false),
      );
    } else {
      emit(
        state.copyWith(pageLoading: false),
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
      emit(
        state.copyWith(pageLoading: false),
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

  Future<void> _initPage() async {
    final user = await _fetchAuthorizedUser();

    _canUpdateTrips = true;

    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    if (_cubitWasClosed) return;

    emit(
      state.copyWith(nowUtc: nowUtc),
    );

    _onNewUser(user);
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

  Future<User> _fetchAuthorizedUser() async {
    final userUuid = await _myTripsInteractor.fetchLocalUserUuid();

    if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
      final user = await _myTripsInteractor.fetchUser(userUuid);

      return user;
    }

    return const User.unauthorized();
  }
}
