import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit()
      : super(
          const AuthorizationState(),
        );

  void updateAuthorizationStatus({required bool authorizationStatus}) {
    emit(
      state.copyWith(authorizationStatus: authorizationStatus),
    );
  }
}
