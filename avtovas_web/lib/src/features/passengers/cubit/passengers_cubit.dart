import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'passengers_state.dart';

class PassengersCubit extends Cubit<PassengersState> {
  PassengersCubit()
      : super(
    const PassengersState(
      route: CustomRoute(
        null,
        null,
      ),
    ),
  );
}
