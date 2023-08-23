import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/avtovas_navigation.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit()
      : super(
    const TripDetailsState(
      route: CustomRoute(null, null,),
    ),
  );
}
