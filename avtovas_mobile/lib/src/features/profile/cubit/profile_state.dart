part of 'profile_cubit.dart';

final class ProfileState extends Equatable {
  final bool? isAuthorized;
  final String? authorizationNumber;

  @override
  List<Object?> get props => [
        isAuthorized,
        authorizationNumber,
      ];

  const ProfileState({
    this.isAuthorized,
    this.authorizationNumber,
  });

  ProfileState copyWith({
    bool? isAuthorized,
    String? authorizationNumber,
  }) {
    return ProfileState(
      isAuthorized: isAuthorized ?? this.isAuthorized,
      authorizationNumber: authorizationNumber ?? this.authorizationNumber,
    );
  }
}
