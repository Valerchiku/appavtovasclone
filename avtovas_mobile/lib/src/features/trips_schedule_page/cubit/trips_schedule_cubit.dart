import 'dart:async';

import 'package:avtovas_mobile/src/common/utils/list_extension.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
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
            foundedTrips: [],
            suggestions: [],
            selectedOption: SortOptions.byTime,
            departurePlace: '',
            arrivalPlace: '',
            searchInProcess: false,
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>>? _avtovasBusStopsSubscription;
  StreamSubscription<List<BusStop>>? _stepanovBusStopsSubscription;
  StreamSubscription<List<Trip>>? _tripsSubscription;

  @override
  Future<void> close() {
    _avtovasBusStopsSubscription?.cancel();
    _avtovasBusStopsSubscription = null;

    _stepanovBusStopsSubscription?.cancel();
    _stepanovBusStopsSubscription = null;

    _tripsSubscription?.cancel();
    _tripsSubscription = null;

    return super.close();
  }

  void search() {
    if (state.departurePlace.isNotEmpty &&
        state.arrivalPlace.isNotEmpty &&
        state.tripDate != null) {
      emit(
        state.copyWith(searchInProcess: true),
      );
      final similarBusStops = _busStopsFromName();
      _tripsFromBusStops(similarBusStops);
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

  void updateFilter(SortOptions newFilter) {
    emit(
      state.copyWith(selectedOption: newFilter),
    );
  }

  void _subscribeAll() {
    _avtovasBusStopsSubscription?.cancel();
    _avtovasBusStopsSubscription =
        _tripsScheduleInteractor.avtovasBusStopsStream.listen(
      _onNewBusStops,
    );

    _stepanovBusStopsSubscription?.cancel();
    _stepanovBusStopsSubscription =
        _tripsScheduleInteractor.stepanovBusStopsStream.listen(
      _onNewBusStops,
    );

    _tripsSubscription?.cancel();
    _tripsSubscription = _tripsScheduleInteractor.tripsStream.listen(
      _onNewTrips,
    );
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

    for (final busStop in busStops) {
      await _tripsScheduleInteractor.getTrips(
        departure: busStop.id,
        destination: arrivalBusStop.id,
        tripsDate: state.tripDate!.requestDateFormat(),
      );
    }
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
    final departureName =
        trips.isNotEmpty ? trips.first.departure.name : state.departurePlace;
    final arrivalName =
        trips.isNotEmpty ? trips.first.destination.name : state.arrivalPlace;
    final tripDate = trips.isNotEmpty
        ? DateTime.parse(trips.first.departureTime)
        : state.tripDate;

    emit(
      state.copyWith(
        foundedTrips: trips,
        departurePlace: departureName,
        arrivalPlace: arrivalName,
        tripDate: tripDate,
      ),
    );
    emit(
      state.copyWith(searchInProcess: false),
    );
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
          (a, b) => a.name.compareTo(departureName),
        );
  }
}
