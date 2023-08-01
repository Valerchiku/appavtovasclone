import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_search_state.dart';

class MainSearchCubit extends Cubit<MainSearchState> {
  MainSearchCubit()
      : super(
          const MainSearchState(),
        );

  void setTripDate(DateTime tripDate) {
    emit(
      state.copyWith(tripDate: tripDate),
    );
  }
}
