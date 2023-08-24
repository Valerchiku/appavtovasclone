part of 'main_cubit.dart';

final class MainState {
  final CustomRoute route;

  const MainState({
    required this.route,
  });

  MainState copyWith({CustomRoute? route,}) {
    return MainState(
      route: route ?? this.route,
    );
  }
}
