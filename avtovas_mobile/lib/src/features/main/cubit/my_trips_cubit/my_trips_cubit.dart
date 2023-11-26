import 'dart:async';

import 'package:collection/collection.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/yookassa_helper/payment_types.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';
import 'package:core/domain/utils/core_logger.dart';
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
            pageLoading: false,
          ),
        ) {
    _initPage();
  }

  StreamSubscription<User>? _userSubscription;

  Timer? _timer;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;

    _timer?.cancel();

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

  Future<void> confirmProcessPassed(VoidCallback onErrorAction) async {
    emit(
      state.copyWith(paymentConfirmationUrl: '', pageLoading: true),
    );

    final paymentStatus = await _myTripsInteractor.fetchPaymentStatus(
      paymentId: state.paymentObject!.id,
    );

    if (paymentStatus == PaymentStatuses.succeeded) {
      final paidTrip = state.upcomingStatusedTrips?.firstWhereOrNull(
        (trip) => trip.uuid == state.paidTripUuid,
      );

      await _myTripsInteractor.updatePaymentsHistory(
        payment: Payment(
          paymentUuid: state.paymentObject!.id,
          paymentPrice: state.paymentObject!.amount.value,
          paymentDate: state.paymentObject!.createdAt,
          paymentDescription: 'Оплата заказа №${paidTrip!.trip.routeNum}',
        ),
      );

      await _myTripsInteractor.changeTripStatuses(
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
  ) async {
    final paymentObject = await _myTripsInteractor.createPaymentObject(
      value: value,
      paymentDescription: paymentDescription,
    );

    if (paymentObject.id != 'error') {
      emit(
        state.copyWith(paymentObject: paymentObject),
      );

      startPaymentConfirmProcess(paymentObject);
    } else {
      emit(
        state.copyWith(pageLoading: false),
      );

      onErrorAction();
    }
  }

  void startPaymentConfirmProcess(YookassaPayment paymentObject) {
    final confirmationUrl = paymentObject.confirmation.confirmationUrl;

    if (confirmationUrl.isNotEmpty &&
        paymentObject.paymentMethod.type == YookassaPaymentTypes.bankCard) {
      emit(
        state.copyWith(paymentConfirmationUrl: confirmationUrl),
      );
    }
  }

  Future<void> _initPage() async {
    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    emit(
      state.copyWith(nowUtc: nowUtc),
    );

    _subscribeAll();
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = _myTripsInteractor.userStream.listen(_onNewUser);
  }

  void _onNewUser(User user) {
    _calculateTimeDifferences(
      user.statusedTrips
          ?.where(
            (trip) => trip.tripCostStatus == UserTripCostStatus.reserved,
          )
          .toList(),
    );

    _updatePaidTrips(
      user.statusedTrips
          ?.where(
            (trip) =>
                trip.tripCostStatus == UserTripCostStatus.paid &&
                trip.tripStatus == UserTripStatus.upcoming,
          )
          .toList(),
    );

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
    _myTripsInteractor.changeTripStatuses(
      tripUuid,
      userTripStatus: UserTripStatus.archive,
      userTripCostStatus: UserTripCostStatus.expiredReverse,
    );
  }

  Future<void> _calculateTimeDifferences(
    List<StatusedTrip>? reservedTrips,
  ) async {
    if (reservedTrips == null) return;

    final nowUtc = await TimeReceiver.fetchUnifiedTime();

    final mapDifferences = <String, int>{};
    for (final trip in reservedTrips) {
      final difference = 600 - nowUtc.difference(trip.saleDate).inSeconds;
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

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (durations.isEmpty) _timer?.cancel();

        final copyDurations = durations;

        for (final key in copyDurations.keys) {
          final seconds = durations[key]!;
          if (seconds == 0) {
            _endTimerCallback(key);
            durations.remove(key);
          } else {
            durations[key] = seconds - 1;
          }
        }

        emit(
          state.copyWith(
            timeDifferences: {},
          ),
        );
        emit(
          state.copyWith(
            timeDifferences: durations,
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
    _myTripsInteractor.changeTripStatuses(
      uuid,
      userTripStatus: userTripStatus,
      userTripCostStatus: userTripCostStatus,
    );
  }
}
