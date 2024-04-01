part of 'profile_cubit.dart';

final class ProfileState extends Equatable {
  final CustomRoute route;
  final bool? isAuthorized;
  final String? authorizationNumber;
  final bool pageLoading;

  @override
  List<Object?> get props => [
        isAuthorized,
        authorizationNumber,
        route,
    pageLoading,
      ];

  const ProfileState({
    required this.route,
    this.isAuthorized,
    this.authorizationNumber,
    this.pageLoading = false,
  });

  ProfileState copyWith({
    CustomRoute? route,
    bool? isAuthorized,
    String? authorizationNumber,
    bool? pageLoading,
  }) {
    return ProfileState(
      route: route ?? this.route,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      authorizationNumber: authorizationNumber ?? this.authorizationNumber,
      pageLoading: pageLoading ?? this.pageLoading,
    );
  }
}
