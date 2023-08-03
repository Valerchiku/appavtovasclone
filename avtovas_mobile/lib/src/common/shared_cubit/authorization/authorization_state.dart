part of 'authorization_cubit.dart';

final class AuthorizationState {
  final bool? authorizationStatus;

  const AuthorizationState({this.authorizationStatus});

  AuthorizationState copyWith({bool? authorizationStatus}) {
    return AuthorizationState(
      authorizationStatus: authorizationStatus ?? this.authorizationStatus,
    );
  }
}
