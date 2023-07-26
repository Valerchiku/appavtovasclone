import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
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

  void updateFilter(SortOptions newFilter) {
    final currentState = state;
    final updatedState = currentState.copyWith(selectedOption: newFilter);
    emit(updatedState);
  }
}
