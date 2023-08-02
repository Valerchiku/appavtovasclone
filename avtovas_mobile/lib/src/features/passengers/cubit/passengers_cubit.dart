import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:common/avtovas_common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'passengers_state.dart';

class PassengersCubit extends Cubit<PassengersState> {
  PassengersCubit()
      : super(
    const PassengersState(
        items: []
    ),
  );

  void setItems(List<MockPassenger> items) {
    emit(
      state.copyWith(items: items),
    );
  }
}
