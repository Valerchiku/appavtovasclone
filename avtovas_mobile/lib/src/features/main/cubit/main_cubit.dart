import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(
          const MainState(
            departurePlace: '',
            arrivalPlace: '',
            route: CustomRoute(null, null),
          ),
        );

  void search() {
    if (state.departurePlace.isNotEmpty &&
        state.arrivalPlace.isNotEmpty &&
        state.tripDate != null) {
      // Search..
    }
  }

  void onDepartureChanged(String departurePlace) {
    emit(
      state.copyWith(departurePlace: departurePlace),
    );
  }

  void onArrivalChanged(String arrivalPlace) {
    emit(
      state.copyWith(arrivalPlace: arrivalPlace),
    );
  }

  void setTripDate(DateTime tripDate) {
    emit(
      state.copyWith(tripDate: tripDate),
    );
  }
}
