part of 'reference_info_cubit.dart';

final class ReferenceInfoState {
  final CustomRoute route;

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
