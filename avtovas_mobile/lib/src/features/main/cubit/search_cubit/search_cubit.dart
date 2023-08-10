import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/utils/list_extension.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchInteractor _searchInteractor;

  SearchCubit(this._searchInteractor)
      : super(
          const SearchState(
            departurePlace: '',
            arrivalPlace: '',
            route: CustomRoute(null, null),
            busStops: [],
            suggestions: [],
            foundedTrips: [],
            isSearchFinished: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>>? _busStopsSubscription;
  StreamSubscription<List<Trip>>? _tripsSubscription;

  void _subscribeAll() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = _searchInteractor.busStopsStream.listen(
      _onNewBusStops,
    );
    _tripsSubscription?.cancel();
    _tripsSubscription = _searchInteractor.tripsStream.listen(_onNewTrips);
  }

  @override
  Future<void> close() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = null;
    _tripsSubscription?.cancel();
    _tripsSubscription = null;

    return super.close();
  }

  void search() {
    if (state.departurePlace.isNotEmpty &&
        state.arrivalPlace.isNotEmpty &&
        state.tripDate != null) {
      final searchableBusStops = _busStopsFromName();
      print(searchableBusStops);
      _tripsFromBusStops(searchableBusStops);
    }
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

  void _navigateToTripsSchedule() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          tripsScheduleConfig(),
        ),
      ),
    );
  }

  void _onNewBusStops(List<BusStop> busStops) {
    final suggestions = busStops.map(
      (busStop) {
        if (busStop.district == null && busStop.region != null) {
          return '${busStop.name}, ${busStop.region}';
        } else if (busStop.district != null && busStop.region == null) {
          return '${busStop.name}, ${busStop.district}';
        } else if (busStop.district == null && busStop.region == null) {
          return busStop.name;
        } else {
          return '${busStop.name}, ${busStop.district}, ${busStop.region}';
        }
      },
    ).toList();

    emit(
      state.copyWith(
        busStops: busStops,
        suggestions: suggestions,
      ),
    );
  }

  void _onNewTrips(List<Trip> trips) {
    emit(
      state.copyWith(foundedTrips: trips),
    );

    if (state.isSearchFinished) {
      _navigateToTripsSchedule();
    }
  }

  Future<void> _tripsFromBusStops(List<BusStop> busStops) async {
    final String arrivalName;
    if (state.arrivalPlace.contains(',')) {
      arrivalName = state.arrivalPlace.split(', ').first;
    } else {
      arrivalName = state.arrivalPlace;
    }

    final arrivalBusStop = state.busStops.firstWhere(
      (busStop) => busStop.name.contains(arrivalName),
    );

    await _searchInteractor.getTrips(
      departure: busStops.first.id,
      destination: arrivalBusStop.id,
      tripsDate: '2023-08-10',
    );

    emit(
      state.copyWith(isSearchFinished: true),
    );
    /*for (final busStop in busStops) {
      print(busStop.name);
      await _searchInteractor.getTrips(
        departure: busStop.id,
        destination: arrivalBusStop.id,
        tripsDate: '2023-08-09',
      );
    }*/
  }

  List<BusStop> _busStopsFromName() {
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
          (a, b) =>
              b.name.compareTo(departureName) - a.name.compareTo(departureName),
        );
  }
}
