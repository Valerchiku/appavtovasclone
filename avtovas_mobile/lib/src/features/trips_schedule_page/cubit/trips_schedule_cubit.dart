import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trips_schedule_state.dart';

// ignore_for_file: depend_on_referenced_packages

class TripsScheduleCubit extends Cubit<TripsScheduleState> {
  TripsScheduleCubit()
      : super(
          const TripsScheduleState(
            selectedOption: SortOptions.byTime,
          ),
        );

  // Метод для обновления выбранного фильтра
  void updateFilter(SortOptions newFilter) {
    emit(TripsScheduleState(selectedOption: newFilter));
  }
}
