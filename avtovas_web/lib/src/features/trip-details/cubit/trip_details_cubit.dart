import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit()
      : super(
          const TripDetailsState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );
}
