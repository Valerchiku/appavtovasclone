import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
          const MainState(
            route: CustomRoute(null, null,),
          ),
        );

  void updateAuthorizationStatus({required bool authorizationStatus}) {
    emit(
      state.copyWith(authorizationStatus: authorizationStatus),
    );
  }
}
