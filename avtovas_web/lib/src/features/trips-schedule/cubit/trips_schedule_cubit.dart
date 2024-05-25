import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/utils/enums/sort_options.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:common/avtovas_utils.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_schedule_state.dart';

class TripsScheduleCubit extends Cubit<TripsScheduleState> {
  final TripsScheduleInteractor _tripsScheduleInteractor;

  TripsScheduleCubit(this._tripsScheduleInteractor)
      : super(
          const TripsScheduleState(
            route: CustomRoute(null, null),
            busStops: [],
            suggestions: [],
            destinationsSuggestions: [],
            selectedOption: SortOptions.byTime,
            departurePlace: '',
            arrivalPlace: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>?>? _busStopsSubscription;
  StreamSubscription<List<Trip>?>? _tripsSubscription;

  StreamSubscription<bool>? _initializationStatusSubscription;

  final _appRouter = AppRouter.appRouter;

  @override
  Future<void> close() {
    _tripsScheduleInteractor.clearTrips();

    _busStopsSubscription?.cancel();
    _busStopsSubscription = null;

    _tripsSubscription?.cancel();
    _tripsSubscription = null;

    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    return super.close();
  }

  void initializationStatusSubscribe(
    String departurePlace,
    String arrivalPlace,
    DateTime tripDate,
  ) {
    _initializationStatusSubscription?.cancel();
    _initializationStatusSubscription = null;

    _initializationStatusSubscription =
        _tripsScheduleInteractor.initializationStatusStream.listen(
      (status) {
        if (status) {
          emit(
            state.copyWith(
              departurePlace: departurePlace,
              arrivalPlace: arrivalPlace,
              tripDate: tripDate,
            ),
          );

          search();
        }
      },
    );
  }

  void goPreviousPage() {
    _appRouter.navigateTo(
      const CustomRoute.pop(),
    );
  }

  void search() {
    if (state.departurePlace.isNotEmpty &&
        state.arrivalPlace.isNotEmpty &&
        state.tripDate != null) {
      _tripsScheduleInteractor.clearTrips();

      final departureName = _destinationName(state.departurePlace);
      final arrivalName = _destinationName(state.arrivalPlace);

      _tripsScheduleInteractor
        ..setTripsScheduleArguments(
          lastSearchedDeparture: departureName,
          lastSearchArrival: arrivalName,
          lastSearchedDate: state.tripDate!,
        )
        ..getTrips(
          departure: departureName,
          destination: arrivalName,
          tripsDate: state.tripDate!.requestDateFormat(),
        );
    }
  }

  void updateSearchHistory(List<String> destination) {
    _tripsScheduleInteractor.updateSearchHistory(destination);
  }

  void onDepartureChanged(String departurePlace) {
    emit(
      state.copyWith(departurePlace: departurePlace),
    );
  }

  void onArrivalChanged(String arrivalPlace) {
    emit(
      state.copyWith(arrivalPlace: arrivalPlace),
    );
  }

  void setTripDate(DateTime tripDate) {
    emit(
      state.copyWith(tripDate: tripDate),
    );
  }

  void updateFilter(
    List<Trip>? trips,
    SortOptions newFilter,
  ) {
    if (trips == null) return;

    if (newFilter == SortOptions.byPrice) {
      trips.sort(
        (a, b) => a.passengerFareCost.compareTo(
          b.passengerFareCost,
        ),
      );
    } else {
      trips.sort(
        (a, b) => a.departureTime.compareTo(b.departureTime),
      );
    }
    emit(
      state.copyWith(selectedOption: newFilter),
    );
  }

  void _subscribeAll() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = _tripsScheduleInteractor.busStopsStream.listen(
      _onNewBusStops,
    );

    _tripsSubscription?.cancel();
    _tripsSubscription = _tripsScheduleInteractor.tripsStream.listen(
      _onNewTrips,
    );
  }

  String _destinationName(String destination) {
    final String destinationName;
    if (destination.contains(',')) {
      destinationName = destination.split(', ').first;
    } else {
      destinationName = destination;
    }

    return destinationName;
  }

  Future<void> _onNewBusStops(List<BusStop>? busStops) async {
    final busStopsSuggestions = await SuggestionsHelperIsolate(
      busStops,
    ).asyncSorting();

    final destinationSuggestions = await DestinationSuggestionsHelperIsolate(
      busStops,
    ).asyncSorting();

    emit(
      state.copyWith(
        busStops: busStops,
        suggestions: busStopsSuggestions,
        destinationsSuggestions: destinationSuggestions,
      ),
    );
  }

  void onTripTap(Trip trip) {
    final isUserAuth = _tripsScheduleInteractor.isAuth;

    if (isUserAuth) {
      _tripsScheduleInteractor.setTripDetailsArguments(
        tripId: trip.id,
        tripDepartureName: trip.departure.name,
        tripDestinationName: trip.destination.name,
      );
    }

    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        tripDetailsConfig(
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

  void _onNewTrips(List<Trip>? trips) {
    final currentTime = DateTime.now().toUtc();

    trips?.removeWhere(
      (trip) => currentTime.isAfter(
        DateTime.parse(trip.departureTime),
      ),
    );

    trips?.removeWhere((element) => element.onSale == 'false');

    updateFilter(trips, state.selectedOption);

    emit(
      state.copyWith(
        clearFoundedTrips: true,
        foundedTrips: trips,
      ),
    );

    if (trips != null && trips.isNotEmpty) {
      final user = _tripsScheduleInteractor.user;

      if (user.searchHistory == null) {
        updateSearchHistory(
          [trips.first.departure.name, trips.first.destination.name],
        );
      }

      if (user.searchHistory != null) {
        if (user.searchHistory!.first.first != trips.first.departure.name ||
            user.searchHistory!.first.last != trips.first.destination.name) {
          updateSearchHistory(
            [trips.first.departure.name, trips.first.destination.name],
          );
        }
      }
    }
  }
}
