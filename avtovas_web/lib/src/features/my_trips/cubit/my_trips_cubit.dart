import 'dart:async';
import 'dart:convert';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/yookassa_helper/payment_types.dart';
import 'package:core/domain/entities/yookassa/yookassa_payment.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

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
            pageLoading: false,
            paymentObject: null,
          ),
        ) {
    _initPage();
    _subscribeAll();
  }

  final _router = AppRouter.appRouter;

  StreamSubscription<User>? _userSubscription;

  Timer? _timer;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;

    _timer?.cancel();

    return super.close();
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

  Future<void> updateTripPaymentStatus({
    required String paymentId,
    required String statusedTripId,
    required VoidCallback onErrorAction,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final paymentStatus = await _myTripsInteractor.fetchPaymentStatus(
      paymentId: paymentId,
    );

    print(paymentStatus);

    if (paymentStatus == PaymentStatuses.succeeded) {
      await _myTripsInteractor.changeTripStatuses(
        statusedTripId,
        userTripCostStatus: UserTripCostStatus.paid,
        paymentUuid: paymentId,
      );
    } else {
      emit(
        state.copyWith(pageLoading: false),
      );

      onErrorAction();
    }
  }

  Future<void> startPayment({
    required String value,
    required String statusedTripId,
    required String paymentDescription,
    required VoidCallback onErrorAction,
  }) async {
    final confirmation = await _myTripsInteractor.generateConfirmationToken(
      value: value,
    );

    final paymentId = confirmation.$1;
    final confirmationToken = confirmation.$2;

    if (paymentId != 'error_id') {
      _router.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          paymentConfig(
            confirmationToken: confirmationToken,
            encodedPaymentParams: '$paymentId?$statusedTripId',
          ),
        ),
      );
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

    print(nowUtc);

    emit(
      state.copyWith(nowUtc: nowUtc),
    );

    _subscribeAll();
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = null;
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

    if (finishedTrips.isNotEmpty) {
      for (final trip in finishedTrips) {
        updateTripStatus(
          trip.uuid,
          UserTripStatus.finished,
        );
      }
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
    _myTripsInteractor.changeTripStatuses(
      uuid,
      userTripStatus: userTripStatus,
      userTripCostStatus: userTripCostStatus,
    );
  }
}
