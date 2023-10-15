part of 'trips_schedule_cubit.dart';

final class TripsScheduleState {
  final CustomRoute route;

  const TripsScheduleState({
    required this.route,
  });

  TripsScheduleState copyWith({
    CustomRoute? route,
  }) {
    return TripsScheduleState(
      route: route ?? this.route,
    );
  }
}
