part of 'profile_cubit.dart';

final class ProfileState extends Equatable {
  final CustomRoute route;
  final bool? isAuthorized;
  final String? authorizationNumber;
  final DialogStatuses dialogStatus;

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
    required this.dialogStatus,
  });

  ProfileState copyWith({
    CustomRoute? route,
    bool? isAuthorized,
    String? authorizationNumber,
    DialogStatuses? dialogStatus,
  }) {
    return ProfileState(
      route: route ?? this.route,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      authorizationNumber: authorizationNumber ?? this.authorizationNumber,
      dialogStatus: dialogStatus ?? this.dialogStatus,
    );
  }
}
