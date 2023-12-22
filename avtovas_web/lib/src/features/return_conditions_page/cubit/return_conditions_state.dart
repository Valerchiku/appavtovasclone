part of 'return_conditions_cubit.dart';

final class ReturnConditionsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ReturnConditionsState({
    required this.route,
  });

  ReturnConditionsState copyWith({
    CustomRoute? route,
  }) {
    return ReturnConditionsState(
      route: route ?? this.route,
    );
  }
}
