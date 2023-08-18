import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
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
            avtovasBusStops: [],
            stepanovBusStops: [],
            suggestions: [],
            selectedOption: SortOptions.byTime,
            departurePlace: '',
            arrivalPlace: '',
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>>? _avtovasBusStopsSubscription;
  StreamSubscription<List<BusStop>>? _stepanovBusStopsSubscription;
  StreamSubscription<List<Trip>?>? _tripsSubscription;

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
      _onNewAvtovasBusStops,
    );

    _stepanovBusStopsSubscription?.cancel();
    _stepanovBusStopsSubscription =
        _tripsScheduleInteractor.stepanovBusStopsStream.listen(
      _onNewStepanovBusStops,
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

  void _onNewStepanovBusStops(List<BusStop> busStops) {
    final stepanovSuggestions = busStops.map(
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

    final suggestions = _excludeDuplicateSuggestions(
      state.suggestions,
      stepanovSuggestions,
    );

    emit(
      state.copyWith(stepanovBusStops: busStops, suggestions: suggestions),
    );
  }

  void _onNewAvtovasBusStops(List<BusStop> busStops) {
    final avtovasSuggestions = busStops.map(
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

    final suggestions = _excludeDuplicateSuggestions(
      state.suggestions,
      avtovasSuggestions,
    );

    emit(
      state.copyWith(
        avtovasBusStops: busStops,
        suggestions: suggestions,
      ),
    );
  }

  List<String> _excludeDuplicateSuggestions(
    List<String> currentSuggestions,
    List<String> newSuggestions,
  ) {
    final uniqueElements = <String>{};

    for (final item in currentSuggestions) {
      final firstWord = item.split(',').first.trim();
      uniqueElements.add(firstWord);
    }

    final mergedList = List<String>.from(currentSuggestions);

    for (final item in newSuggestions) {
      final firstWord = item.split(',').first.trim();
      if (!uniqueElements.contains(firstWord)) {
        mergedList.add(item);
      }
    }

    return mergedList;
  }

  void _onNewTrips(List<Trip>? trips) {
    emit(
      state.copyWith(
        clearFoundedTrips: true,
        foundedTrips: trips,
      ),
    );
  }

  void onTripTap(Trip trip) {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          tripDetailsConfig(
            routeId: trip.id,
            busStop: trip.departure.name,
          ),
        ),
      ),
    );
    _resetRoute();
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
