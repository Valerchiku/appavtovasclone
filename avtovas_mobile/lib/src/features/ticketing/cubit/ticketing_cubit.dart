import 'package:common/avtovas_common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticketing_state.dart';

class TicketingCubit extends Cubit<TicketingState> {
  TicketingCubit()
      : super(
          const TicketingState(
            firstName: '',
            lastName: '',
            withoutSurname: true,
            currentGender: Genders.male,
          ),
        );

  void changeSurnameVisibility({required bool withoutSurname}) {
    emit(
      state.copyWith(withoutSurname: withoutSurname),
    );
  }

  void onGenderChanged(Genders gender) {
    emit(
      state.copyWith(currentGender: gender),
    );
  }
}
