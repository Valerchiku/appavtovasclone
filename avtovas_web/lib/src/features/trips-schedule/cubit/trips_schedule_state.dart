part of 'trips_schedule_cubit.dart';

final class TripsSceduleState {
  final CustomRoute route;

  const TripsSceduleState({
    required this.route,
  });

  TripsSceduleState copyWith({bool? authorizationStatus}) {
    return TripsSceduleState(
      route: route ?? this.route,
    );
  }
}
