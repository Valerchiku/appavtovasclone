import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(
          const ProfileState(),
        ) {
    _checkAuthorizationStatus();
  }

  void _checkAuthorizationStatus() {
    // ... Check user ID from Prefs?
    emit(
      state.copyWith(isAuthorized: false),
    );
  }
}
