import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'help_state.dart';

class ContactsCubit extends Cubit<HelpState> {
  ContactsCubit()
      : super(
    const HelpState(
      route: CustomRoute(
        null,
        null,
      ),
    ),
  );
}
