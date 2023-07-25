import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit()
      : super(
          const TripDetailsEmptyState(),
        ) {
    _setTrip();
  }

  void _setTrip() {
    emit(
      const TripDetailsLoadedState(),
    );
  }
}
