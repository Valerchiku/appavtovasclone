part of 'trip_details_cubit.dart';

final class TripDetailsState {
  final CustomRoute route;

  const TripDetailsState({
    required this.route,
  });

  TripDetailsState copyWith({bool? authorizationStatus}) {
    return TripDetailsState(
      route: route ?? this.route,
    );
  }
}
