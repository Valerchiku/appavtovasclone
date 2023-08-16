part of 'trip_details_cubit.dart';

class TripDetailsState extends Equatable {
  final CustomRoute route;
  final SingleTrip? singleTrip;
  final String tripId;
  final String busStop;
  @override
  List<Object?> get props => [
        route,
        singleTrip,
        tripId,
        busStop,
      ];

  const TripDetailsState({
    required this.route,
    required this.singleTrip,
    required this.tripId,
    required this.busStop,
  });

  TripDetailsState copyWith({
    CustomRoute? route,
    SingleTrip? singleTrip,
    String? tripId,
    String? busStop,
  }) {
    return TripDetailsState(
      route: route ?? this.route,
      singleTrip: singleTrip ?? this.singleTrip,
      tripId: tripId ?? this.tripId,
      busStop: busStop ?? this.busStop,
    );
  }
}
