part of 'authorization_cubit.dart';

final class AuthorizationState extends Equatable {
  final CustomRoute route;
  final AuthorizationContent content;
  final String phoneNumber;
  final String expectedCode;
  final String enteredCode;

  @override
  List<Object?> get props => [
        route,
        content,
        phoneNumber,
        expectedCode,
        enteredCode,
      ];

  const AuthorizationState({
    required this.route,
    required this.content,
    required this.phoneNumber,
    required this.expectedCode,
    required this.enteredCode,
  });

  AuthorizationState copyWith({
    CustomRoute? route,
    AuthorizationContent? content,
    String? phoneNumber,
    String? expectedCode,
    String? enteredCode,
  }) {
    return AuthorizationState(
      route: route ?? this.route,
      content: content ?? this.content,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      expectedCode: expectedCode ?? this.expectedCode,
      enteredCode: enteredCode ?? this.enteredCode,
    );
  }
}
