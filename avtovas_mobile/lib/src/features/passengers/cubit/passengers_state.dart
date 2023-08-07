part of 'passengers_cubit.dart';

final class PassengersState extends Equatable {
  final CustomRoute route;
  final List<MockPassenger> passengers;

  @override
  List<Object?> get props => [
        passengers,
        route,
      ];

  const PassengersState({
    required this.route,
    required this.passengers,
  });

  PassengersState copyWith({
    CustomRoute? route,
    List<MockPassenger>? passengers,
  }) {
    return PassengersState(
      route: route ?? this.route,
      passengers: passengers ?? this.passengers,
    );
  }
}
