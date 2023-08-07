part of 'search_cubit.dart';

final class SearchState extends Equatable {
  final DateTime? tripDate;
  final String departurePlace;
  final String arrivalPlace;
  final CustomRoute route;

  @override
  List<Object?> get props => [
        tripDate,
        departurePlace,
        arrivalPlace,
        route,
      ];

  const SearchState({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.route,
    this.tripDate,
  });

  SearchState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
    CustomRoute? route,
  }) {
    return SearchState(
      tripDate: tripDate ?? this.tripDate,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      route: route ?? this.route,
    );
  }
}
