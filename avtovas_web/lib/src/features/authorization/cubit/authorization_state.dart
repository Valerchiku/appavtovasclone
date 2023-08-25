part of 'authorization_cubit.dart';

final class AuthorizationState {
  final CustomRoute route;

  const AuthorizationState({
    required this.route,
  });

  AuthorizationState copyWith({CustomRoute? route,}) {
    return AuthorizationState(
      route: route ?? this.route,
    );
  }
}
