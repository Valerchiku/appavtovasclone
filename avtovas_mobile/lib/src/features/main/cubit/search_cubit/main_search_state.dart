part of 'main_search_cubit.dart';

final class MainSearchState extends Equatable {
  final DateTime? tripDate;
  final BusStop? departureBusStop;
  final BusStop? arrivalBusStop;
  final CustomRoute route;
  final List<BusStop> avtovasBusStops;
  final List<BusStop> stepanovBusStops;
  final List<BusStop> suggestions;

  @override
  List<Object?> get props => [
        tripDate,
        departureBusStop,
        arrivalBusStop,
        route,
        avtovasBusStops,
        stepanovBusStops,
        suggestions,
      ];

  const MainSearchState({
    required this.route,
    required this.avtovasBusStops,
    required this.stepanovBusStops,
    required this.suggestions,
    this.departureBusStop,
    this.arrivalBusStop,
    this.tripDate,
  });

  MainSearchState copyWith({
    DateTime? tripDate,
    BusStop? departureBusStop,
    BusStop? arrivalBusStop,
    CustomRoute? route,
    List<BusStop>? avtovasBusStops,
    List<BusStop>? stepanovBusStops,
    List<BusStop>? suggestions,
  }) {
    return MainSearchState(
      tripDate: tripDate ?? this.tripDate,
      departureBusStop: departureBusStop ?? this.departureBusStop,
      arrivalBusStop: arrivalBusStop ?? this.arrivalBusStop,
      route: route ?? this.route,
      avtovasBusStops: avtovasBusStops ?? this.avtovasBusStops,
      stepanovBusStops: stepanovBusStops ?? this.stepanovBusStops,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
