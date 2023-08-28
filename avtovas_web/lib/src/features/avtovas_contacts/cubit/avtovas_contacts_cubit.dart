import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avtovas_contacts_state.dart';

class AvtovasContactsCubit extends Cubit<AvtovasContactsState> {
  AvtovasContactsCubit()
      : super(
          const AvtovasContactsState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
