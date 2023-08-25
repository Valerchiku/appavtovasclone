import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit()
      : super(
          const HelpState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
