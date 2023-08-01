part of 'profile_cubit.dart';

final class ProfileState extends Equatable {
  final bool? isAuthorized;

  @override
  List<Object?> get props => [isAuthorized];

  const ProfileState({this.isAuthorized});

  ProfileState copyWith({bool? isAuthorized}) {
    return ProfileState(
      isAuthorized: isAuthorized ?? this.isAuthorized,
    );
  }
}
