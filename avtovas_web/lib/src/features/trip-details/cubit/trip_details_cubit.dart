import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
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
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<(SingleTrip?, bool)>? _singleTripSubscription;
  StreamSubscription<bool>? _initializationStatusSubscription;

  final _appRouter = AppRouter.appRouter;

  @override
  Future<void> close() {
    _tripDetailsInteractor.clearTrip();

    _singleTripSubscription?.cancel();
    _singleTripSubscription = null;

    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    return super.close();
  }

  void goPreviousPage() {
    _appRouter.navigateTo(
      const CustomRoute.pop(),
    );
  }

  void initializationStatusSubscribe({
    required String tripId,
    required String departure,
    required String destination,
    required String dbName,
  }) {
    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    _initializationStatusSubscription =
        _tripDetailsInteractor.initializationStatusStream.listen(
      (status) {
        if (status) {
          _tripDetailsInteractor
            ..clearTrip()
            ..getTrip(
              tripId: tripId,
              departure: departure,
              destination: destination,
              dbName: dbName,
            );
        }
      },
    );
  }

  void _subscribeAll() {
    _tripDetailsInteractor.clearTrip();

    _singleTripSubscription?.cancel();
    _singleTripSubscription = _tripDetailsInteractor.singleTripStream.listen(
      (event) => _onNewSingleTrip(event.$1, canEmitReceivedTrip: event.$2),
    );
  }

  void _onNewSingleTrip(
    SingleTrip? singleTrip, {
    required bool canEmitReceivedTrip,
  }) {
    if (!canEmitReceivedTrip || singleTrip == null) return;

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
    _tripDetailsInteractor.setTicketingArgs(state.singleTrip!);

    final trip = state.singleTrip!;

    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        ticketingConfig(
          trip: trip,
          routeId: trip.id,
          departure: trip.departure.name,
          destination: trip.destination.name,
          dbName: trip.dbName,
          pathParameters: {
            'route_id': trip.id,
            'departure': trip.departure.name,
            'destination': trip.destination.name,
            'db_name': trip.dbName,
          },
        ),
      ),
    );
  }

  void onReturnConditionsTap() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        termsOfUseConfig(),
      ),
    );
  }

  void clearTrip() {
    _tripDetailsInteractor.clearTrip();
  }
}
