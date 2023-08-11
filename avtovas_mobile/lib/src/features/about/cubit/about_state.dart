part of 'about_cubit.dart';

final class AboutState extends Equatable {
  final CustomRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const AboutState({
    required this.route,
  });

  AboutState copyWith({
    CustomRoute? route,
  }) {
    return AboutState(
      route: route ?? this.route,
    );
  }
}
