import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit()
      : super(
    const ContactsState(
      route: CustomRoute(
        null,
        null,
      ),
    ),
  );
}
