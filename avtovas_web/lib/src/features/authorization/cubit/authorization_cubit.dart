import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit()
      : super(
          const AuthorizationState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
