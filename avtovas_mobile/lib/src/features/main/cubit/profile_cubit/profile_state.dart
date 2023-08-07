part of 'profile_cubit.dart';

final class ProfileState extends Equatable {
  final CustomRoute route;
  final bool? isAuthorized;
  final String? authorizationNumber;

  @override
  List<Object?> get props => [
        isAuthorized,
        authorizationNumber,
        route,
      ];

  const ProfileState({
    required this.route,
    this.isAuthorized,
    this.authorizationNumber,
  });

  ProfileState copyWith({
    CustomRoute? route,
    bool? isAuthorized,
    String? authorizationNumber,
  }) {
    return ProfileState(
      route: route ?? this.route,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      authorizationNumber: authorizationNumber ?? this.authorizationNumber,
    );
  }
}
