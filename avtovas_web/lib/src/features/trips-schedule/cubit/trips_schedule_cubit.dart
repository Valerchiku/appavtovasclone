import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'trips_schedule_state.dart';

class TripsSceduleCubit extends Cubit<TripsSceduleState> {
  TripsSceduleCubit()
      : super(
    const TripsSceduleState(
      route: CustomRoute(null, null,),
    ),
  );
}
