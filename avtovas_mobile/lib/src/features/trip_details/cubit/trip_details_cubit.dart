import 'dart:async';

import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final TripDetailsInteractor _tripDetailsInteractor;
  TripDetailsCubit(this._tripDetailsInteractor)
      : super(
          const TripDetailsState(
            route: CustomRoute(null, null),
            singleTrip: null,
            tripId: '',
            busStop: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<SingleTrip?>? _singleTripSubscription;

  @override
  Future<void> close() {
    _singleTripSubscription?.cancel();
    _singleTripSubscription = null;

    return super.close();
  }

  void setTrip(
    String tripId,
    String busStop,
  ) {
    emit(
      state.copyWith(
        tripId: tripId,
        busStop: busStop,
      ),
    );

    getSingleTrip();
  }

  void getSingleTrip() {
    if (state.tripId.isNotEmpty && state.busStop.isNotEmpty) {
      _tripDetailsInteractor.clearTrip();

      final tripId = state.tripId;
      final busStop = state.busStop;

      _tripDetailsInteractor.getTrip(
        tripId: tripId,
        busStop: busStop,
      );
    }
  }

  void _subscribeAll() {
    _singleTripSubscription?.cancel();
    _singleTripSubscription = _tripDetailsInteractor.singleTripStream.listen(
      _onNewSingleTrip,
    );
  }

  void _onNewSingleTrip(SingleTrip? singleTrip) {
    emit(
      state.copyWith(
        singleTrip: singleTrip,
      ),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.routeByIndex(navigationIndex),
      ),
    );
  }

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }
}
