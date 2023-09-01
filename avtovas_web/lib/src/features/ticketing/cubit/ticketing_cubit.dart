import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticketing_state.dart';

class TicketingCubit extends Cubit<TicketingState> {
  TicketingCubit()
      : super(
          const TicketingState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
