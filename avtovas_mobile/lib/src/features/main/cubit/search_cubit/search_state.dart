part of 'search_cubit.dart';

final class SearchState extends Equatable {
  final DateTime? tripDate;
  final String departurePlace;
  final String arrivalPlace;
  final CustomRoute route;
  final List<BusStop> busStops;
  final List<String> suggestions;
  final List<Trip> foundedTrips;
  final bool isSearchFinished;

  @override
  List<Object?> get props => [
        tripDate,
        departurePlace,
        arrivalPlace,
        route,
        busStops,
        suggestions,
        foundedTrips,
        isSearchFinished,
      ];

  const SearchState({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.route,
    required this.busStops,
    required this.foundedTrips,
    required this.suggestions,
    required this.isSearchFinished,
    this.tripDate,
  });

  SearchState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
    CustomRoute? route,
    List<BusStop>? busStops,
    List<Trip>? foundedTrips,
    List<String>? suggestions,
    bool? isSearchFinished,
  }) {
    return SearchState(
      tripDate: tripDate ?? this.tripDate,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      route: route ?? this.route,
      busStops: busStops ?? this.busStops,
      foundedTrips: foundedTrips ?? this.foundedTrips,
      suggestions: suggestions ?? this.suggestions,
      isSearchFinished: isSearchFinished ?? this.isSearchFinished,
    );
  }
}
