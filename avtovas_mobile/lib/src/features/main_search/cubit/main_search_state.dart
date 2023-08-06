part of 'main_search_cubit.dart';

final class MainSearchState extends Equatable {
  final DateTime? tripDate;
  final String departurePlace;
  final String arrivalPlace;

  @override
  List<Object?> get props => [
        tripDate,
        departurePlace,
        arrivalPlace,
      ];

  const MainSearchState({
    required this.departurePlace,
    required this.arrivalPlace,
    this.tripDate,
  });

  MainSearchState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
  }) {
    return MainSearchState(
      tripDate: tripDate ?? this.tripDate,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
    );
  }
}
