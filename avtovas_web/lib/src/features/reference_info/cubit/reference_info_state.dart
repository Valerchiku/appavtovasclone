part of 'reference_info_cubit.dart';

final class ReferenceInfoState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const ReferenceInfoState({
    required this.route,
  });

  ReferenceInfoState copyWith({
    CustomRoute? route,
  }) {
    return ReferenceInfoState(
      route: route ?? this.route,
    );
  }
}
