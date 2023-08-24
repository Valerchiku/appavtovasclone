import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
          const MainState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
