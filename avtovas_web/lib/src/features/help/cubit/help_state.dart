part of 'help_cubit.dart';

final class HelpState {
  final CustomRoute route;

  const HelpState({
    required this.route,
  });

  HelpState copyWith({
    CustomRoute? route,
  }) {
    return HelpState(
      route: route ?? this.route,
    );
  }
}
