part of 'support_cubit.dart';

final class SupportState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const SupportState({
    required this.route,
  });

SupportState copyWith({
    CustomRoute? route,
  }) {
    return SupportState(
      route: route ?? this.route,
    );
  }
}
