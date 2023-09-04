import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/common/utils/trip_status.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/utils/core_logger.dart';
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
            selectedOption: SortOptions.byTime,
            departurePlace: '',
            arrivalPlace: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>?>? _busStopsSubscription;
  StreamSubscription<List<Trip>?>? _tripsSubscription;

  @override
  Future<void> close() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = null;

    _tripsSubscription?.cancel();
    _tripsSubscription = null;

    return super.close();
  }

  void setDestination(
    String departurePlace,
    String arrivalPlace,
    DateTime tripDate,
  ) {
    emit(
      state.copyWith(
        departurePlace: departurePlace,
        arrivalPlace: arrivalPlace,
        tripDate: tripDate,
      ),
    );

    search();
  }

  void search() {
    if (state.departurePlace.isNotEmpty &&
        state.arrivalPlace.isNotEmpty &&
        state.tripDate != null) {
      _tripsScheduleInteractor.clearTrips();

      final departureName = _destinationName(state.departurePlace);
      final arrivalName = _destinationName(state.arrivalPlace);

      _tripsScheduleInteractor.getTrips(
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
    if (newFilter == SortOptions.byPrice) {
      trips!.sort(
        (a, b) => a.passengerFareCost.compareTo(
          b.passengerFareCost,
        ),
      );
    } else {
      trips!.sort(
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

  void _onNewBusStops(List<BusStop>? busStops) {
    final busStopsSuggestions = busStops?.map(
      (busStop) {
        if (busStop.district != null && busStop.region != null) {
          return '${busStop.name}, ${busStop.district}, ${busStop.region}';
        } else if (busStop.district != null && busStop.region == null) {
          return '${busStop.name}, ${busStop.district}';
        } else if (busStop.district == null && busStop.region != null) {
          return '${busStop.name}, ${busStop.region}';
        } else {
          return busStop.name;
        }
      },
    ).toList();

    emit(
      state.copyWith(
        busStops: busStops,
        suggestions: Set<String>.from(busStopsSuggestions!).toList(),
      ),
    );
  }

  void onTripTap(Trip trip, String status) {
    final tripStatus = _convertTripStatus(status);
    emit(
      state.copyWith(
        route: CustomRoute(
          _routeTypeByStatus(tripStatus),
          _tripsScheduleInteractor.isAuth
              ? tripDetailsConfig(
                  routeId: trip.id,
                  busStop: trip.departure.name,
                )
              : authConfig(
                  content: AuthorizationContent.phone,
                ),
        ),
      ),
    );
    _resetRoute();
  }

  void _onNewTrips(List<Trip>? trips) {
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

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

/*List<BusStop> _busStopsFromName() {
    final String departureName;
    if (state.departurePlace.contains(',')) {
      departureName = state.departurePlace.split(', ').first;
    } else {
      departureName = state.departurePlace;
    }

    final similarNames = state.busStops
        .map((busStop) => busStop.name)
        .toList()
        .filterSimilarStrings(departureName)
      ..insert(0, departureName);

    return state.busStops
        .where(
          (busStop) => similarNames.contains(busStop.name),
        )
        .toList()
        .sorted(
          (a, b) => a.name.compareTo(departureName),
        );
  }*/

/*Future<void> _tripsFromBusStops(List<BusStop> busStops) async {
    final String arrivalName;
    if (state.arrivalPlace.contains(',')) {
      arrivalName = state.arrivalPlace.split(', ').first;
    } else {
      arrivalName = state.arrivalPlace;
    }

    final arrivalBusStop = state.busStops.firstWhere(
      (busStop) => busStop.name.contains(arrivalName),
    );

    for (final busStop in busStops) {
      await _tripsScheduleInteractor.getTrips(
        departure: busStop.id,
        destination: arrivalBusStop.id,
        tripsDate: state.tripDate!.requestDateFormat(),
      );
    }
  }*/
}
