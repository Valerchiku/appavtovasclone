import 'dart:async';

import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
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
          ),
        ) {
    _subscribeAll();
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

  void startPayment() {
    _myTripsInteractor.startPayment();
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

  void _endTimerCallback(String tripUuid) {
    _myTripsInteractor.changeTripStatuses(
      tripUuid,
      userTripStatus: UserTripStatus.archive,
      userTripCostStatus: UserTripCostStatus.expiredReverse,
    );
  }

  void _calculateTimeDifferences(List<StatusedTrip>? reservedTrips) {
    if (reservedTrips == null) return;

    final now = DateTime.now();

    final mapDifferences = <String, int>{};

    for (final trip in reservedTrips) {
      final difference = 600 - now.difference(trip.saleDate).inSeconds;
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
}
