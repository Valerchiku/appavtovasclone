part of 'main_search_cubit.dart';

final class MainSearchState extends Equatable {
  final DateTime? tripDate;
  final String? departurePlace;
  final String? arrivalPlace;
  final CustomRoute route;
  final List<BusStop> busStops;
  final List<String> suggestions;
  final List<String> destinationSuggestions;
  final List<List<String>> searchHistory;
  final bool pageLoading;

  @override
  List<Object?> get props => [
        tripDate,
        pageLoading,
        departurePlace,
        arrivalPlace,
        searchHistory,
        route,
        busStops,
        suggestions,
        destinationSuggestions,
        searchHistory,
      ];

  const MainSearchState({
    required this.route,
    required this.busStops,
    required this.suggestions,
    required this.destinationSuggestions,
    required this.searchHistory,
    required this.pageLoading,
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
    bool? pageLoading,
    List<String>? suggestions,
    List<String>? destinationSuggestions,
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
      pageLoading: pageLoading ?? this.pageLoading,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      route: route ?? this.route,
      busStops: busStops ?? this.busStops,
      destinationSuggestions:
          destinationSuggestions ?? this.destinationSuggestions,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
