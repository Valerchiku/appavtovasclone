import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bus_station_contacts_state.dart';

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
