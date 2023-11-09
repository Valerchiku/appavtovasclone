part of 'trip_details_cubit.dart';

class TripDetailsState extends Equatable {
  final CustomRoute route;
  final SingleTrip? singleTrip;
  @override
  List<Object?> get props => [
    route,
    singleTrip,
  ];

  const TripDetailsState({
    required this.route,
    required this.singleTrip,
  });

  TripDetailsState copyWith({
    CustomRoute? route,
    SingleTrip? singleTrip,
  }) {
    return TripDetailsState(
      route: route ?? this.route,
      singleTrip: singleTrip ?? this.singleTrip,
    );
  }
}
