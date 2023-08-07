part of 'main_cubit.dart';

final class MainState extends Equatable {
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

  const MainState({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.route,
    this.tripDate,
  });

  MainState copyWith({
    DateTime? tripDate,
    String? departurePlace,
    String? arrivalPlace,
    CustomRoute? route,
  }) {
    return MainState(
      tripDate: tripDate ?? this.tripDate,
      departurePlace: departurePlace ?? this.departurePlace,
      arrivalPlace: arrivalPlace ?? this.arrivalPlace,
      route: route ?? this.route,
    );
  }
}
