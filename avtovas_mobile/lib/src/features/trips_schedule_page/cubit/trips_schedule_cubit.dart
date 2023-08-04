import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_schedule_state.dart';


class TripsScheduleCubit extends Cubit<TripsScheduleState> {
  TripsScheduleCubit()
      : super(
          const TripsScheduleState(
            selectedOption: SortOptions.byTime,
          ),
        );

  void updateFilter(SortOptions newFilter) {
    emit(state.copyWith(selectedOption: newFilter));
  }
}
