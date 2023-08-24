part of 'passengers_cubit.dart';

final class PassengersState {
  final CustomRoute route;

  const PassengersState({
    required this.route,
  });

PassengersState copyWith({
    CustomRoute? route,
  }) {
    return PassengersState(
      route: route ?? this.route,
    );
  }
}
