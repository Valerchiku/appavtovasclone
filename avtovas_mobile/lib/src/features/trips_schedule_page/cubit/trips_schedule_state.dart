// ignore_for_file: member-ordering

part of 'trips_schedule_cubit.dart';

class TripsScheduleState extends Equatable {
  final CustomRoute route;
  final List<BusStop> busStops;
  final List<Trip> foundedTrips;
  final List<String> suggestions;
  final SortOptions selectedOption;
  final String departurePlace;
  final String arrivalPlace;
  final DateTime? tripDate;

  const TripsScheduleState({
    required this.route,
    required this.busStops,
    required this.foundedTrips,
    required this.suggestions,
    required this.selectedOption,
    required this.departurePlace,
    required this.arrivalPlace,
    this.tripDate,
  });

  TripsScheduleState copyWith({
    CustomRoute? route,
    List<BusStop>? busStops,
    List<Trip>? foundedTrips,
    List<String>? suggestions,
    SortOptions? selectedOption,
    String? departurePlace,
    String? arrivalPlace,
    DateTime? tripDate,
  }) {
    return TripsScheduleState(
      route: route ?? this.route,
      busStops: busStops ?? this.busStops,
      foundedTrips: foundedTrips ?? this.foundedTrips,
      suggestions: suggestions ?? this.suggestions,
      selectedOption: selectedOption ?? this.selectedOption,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      tripDate: tripDate ?? this.tripDate,
    );
  }

  @override
  List<Object?> get props => [
        route,
        busStops,
        foundedTrips,
        suggestions,
        selectedOption,
        departurePlace,
        arrivalPlace,
        tripDate,
      ];
}
