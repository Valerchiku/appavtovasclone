part of 'main_search_cubit.dart';

final class MainSearchState extends Equatable {
  final DateTime? tripDate;
  final String? departurePlace;
  final String? arrivalPlace;
  final CustomRoute route;
  final List<BusStop> busStops;
  final List<String> suggestions;
  final List<List<String>> searchHistory;

  @override
  List<Object?> get props => [
        tripDate,
        departurePlace,
        arrivalPlace,
        searchHistory,
        route,
        busStops,
        suggestions,
        searchHistory,
      ];

  const MainSearchState({
    required this.route,
    required this.busStops,
    required this.suggestions,
    required this.searchHistory,
    this.departurePlace,
    this.arrivalPlace,
    this.tripDate,
  });

  MainSearchState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
    CustomRoute? route,
    List<BusStop>? busStops,
    List<String>? suggestions,
    List<List<String>>? searchHistory,
    bool? clearTripDate,
  }) {
    return MainSearchState(
      tripDate: clearTripDate != null
          ? clearTripDate
              ? tripDate
              : tripDate ?? this.tripDate
          : tripDate ?? this.tripDate,
      searchHistory: searchHistory ?? this.searchHistory,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      route: route ?? this.route,
      busStops: busStops ?? this.busStops,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
