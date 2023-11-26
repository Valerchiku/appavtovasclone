part of 'terms_of_use_cubit.dart';


final class TermsOfUseState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const TermsOfUseState({
    required this.route,
  });

  TermsOfUseState copyWith({
    CustomRoute? route,
  }) {
    return TermsOfUseState(
      route: route ?? this.route,
    );
  }
}
