part of 'trips_schedule_cubit.dart';

final class TripsSceduleState {
  final CustomRoute route;

  const TripsSceduleState({
    required this.route,
  });

  TripsSceduleState copyWith({CustomRoute? route,}) {
    return TripsSceduleState(
      route: route ?? this.route,
    );
  }
}
