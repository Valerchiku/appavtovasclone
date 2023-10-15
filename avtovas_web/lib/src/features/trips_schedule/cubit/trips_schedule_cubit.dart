import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_schedule_state.dart';

class TripsScheduleCubit extends Cubit<TripsScheduleState> {
  TripsScheduleCubit()
      : super(
          const TripsScheduleState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
