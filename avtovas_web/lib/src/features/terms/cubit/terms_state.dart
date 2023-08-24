part of 'terms_cubit.dart';

final class TermsState {
  final CustomRoute route;

  const TermsState({
    required this.route,
  });

TermsState copyWith({
    CustomRoute? route,
  }) {
    return TermsState(
      route: route ?? this.route,
    );
  }
}
