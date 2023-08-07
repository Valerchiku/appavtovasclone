part of 'reference_cubit.dart';

final class ReferenceState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ReferenceState({
    required this.route,
  });

  ReferenceState copyWith({
    CustomRoute? route,
  }) {
    return ReferenceState(
      route: route ?? this.route,
    );
  }
}
