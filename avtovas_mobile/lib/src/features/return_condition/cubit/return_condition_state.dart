part of 'return_condition_cubit.dart';

final class ReturnConditionState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ReturnConditionState({
    required this.route,
  });

  ReturnConditionState copyWith({
    CustomRoute? route,
  }) {
    return ReturnConditionState(
      route: route ?? this.route,
    );
  }
}
