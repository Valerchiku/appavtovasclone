import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/utils/enums/trip_status.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
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
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<SingleTrip?>? _singleTripSubscription;
  StreamSubscription<StartSaleSession?>? _saleSessionSubscription;

  final _appRouter = AppRouter.appRouter;

  @override
  Future<void> close() {
    _singleTripSubscription?.cancel();
    _singleTripSubscription = null;

    _saleSessionSubscription?.cancel();
    _saleSessionSubscription = null;

    return super.close();
  }

  void getSingleTrip({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    _tripDetailsInteractor
      ..clearTrip()
      ..getTrip(
        tripId: tripId,
        departure: departure,
        destination: destination,
      );
  }

  void startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) {
    _tripDetailsInteractor
      ..clearSession()
      ..startSaleSession(
        tripId: tripId,
        departure: departure,
        destination: destination,
      );
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

  void onBuyButtonTap(
    SingleTrip singleTrip,
    String status,
  ) {
    final tripStatus = _convertTripStatus(status);

    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        ticketingConfig(trip: state.singleTrip!),
      ),
    );
  }

  TripStatus _convertTripStatus(String status) => switch (status) {
        'Departed' => TripStatus.departed,
        'Arrived' => TripStatus.arrived,
        'Waiting' => TripStatus.waiting,
        'Cancelled' => TripStatus.cancelled,
        _ => TripStatus.undefined,
      };

  RouteType? _routeTypeByStatus(TripStatus tripStatus) => switch (tripStatus) {
        TripStatus.departed => null,
        TripStatus.arrived => RouteType.navigateTo,
        TripStatus.waiting => RouteType.navigateTo,
        TripStatus.cancelled => null,
        TripStatus.undefined => null,
      };

  void clearTrip() {
    _tripDetailsInteractor.clearTrip();
  }
}
