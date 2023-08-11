part of 'terms_cubit.dart';

final class TermsState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

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
