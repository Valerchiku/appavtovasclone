// ignore_for_file: member-ordering

part of 'trips_schedule_cubit.dart';

class TripsScheduleState extends Equatable {
  final CustomRoute route;
  final List<BusStop> avtovasBusStops;
  final List<BusStop> stepanovBusStops;
  final List<Trip>? foundedTrips;
  final List<String> suggestions;
  final SortOptions selectedOption;
  final String departurePlace;
  final String arrivalPlace;
  final DateTime? tripDate;

  const TripsScheduleState({
    required this.route,
    required this.avtovasBusStops,
    required this.stepanovBusStops,
    required this.suggestions,
    required this.selectedOption,
    required this.departurePlace,
    required this.arrivalPlace,
    this.tripDate,
    this.foundedTrips,
  });

  TripsScheduleState copyWith({
    CustomRoute? route,
    List<BusStop>? avtovasBusStops,
    List<BusStop>? stepanovBusStops,
    List<Trip>? foundedTrips,
    List<String>? suggestions,
    SortOptions? selectedOption,
    String? departurePlace,
    String? arrivalPlace,
    DateTime? tripDate,
    bool? clearFoundedTrips,
  }) {
    return TripsScheduleState(
      route: route ?? this.route,
      avtovasBusStops: avtovasBusStops ?? this.avtovasBusStops,
      stepanovBusStops: stepanovBusStops ?? this.stepanovBusStops,
      foundedTrips: clearFoundedTrips != null
          ? clearFoundedTrips
              ? foundedTrips
              : foundedTrips ?? this.foundedTrips
          : foundedTrips ?? this.foundedTrips,
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
        avtovasBusStops,
        stepanovBusStops,
        foundedTrips,
        suggestions,
        selectedOption,
        departurePlace,
        arrivalPlace,
        tripDate,
      ];
}
