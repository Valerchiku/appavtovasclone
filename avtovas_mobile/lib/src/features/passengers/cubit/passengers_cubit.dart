import 'package:common/avtovas_common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'passengers_state.dart';

class PassengersCubit extends Cubit<PassengersState> {
  PassengersCubit()
      : super(
          const PassengersState(
            passengers: [],
          ),
        );

  void setPassengers(List<MockPassenger> passengers) {
    emit(
      state.copyWith(passengers: passengers),
    );
  }
}
