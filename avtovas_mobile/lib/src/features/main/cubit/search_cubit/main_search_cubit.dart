import 'dart:async';

import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_search_state.dart';

class MainSearchCubit extends Cubit<MainSearchState> {
  final SearchInteractor _searchInteractor;

  MainSearchCubit(this._searchInteractor)
      : super(
          const MainSearchState(
            route: CustomRoute(null, null),
            avtovasBusStops: [],
            stepanovBusStops: [],
            suggestions: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<List<BusStop>>? _avtovasBusStopsSubscription;
  StreamSubscription<List<BusStop>>? _stepanovBusStopsSubscription;

  void _subscribeAll() {
    _avtovasBusStopsSubscription?.cancel();
    _avtovasBusStopsSubscription =
        _searchInteractor.avtovasBusStopsStream.listen(
      _onNewAvtovasBusStops,
    );
    _stepanovBusStopsSubscription?.cancel();
    _stepanovBusStopsSubscription =
        _searchInteractor.stepanovBusStopsStream.listen(
      _onNewStepanovBusStops,
    );
  }

  @override
  Future<void> close() {
    _avtovasBusStopsSubscription?.cancel();
    _avtovasBusStopsSubscription = null;
    _stepanovBusStopsSubscription?.cancel();
    _stepanovBusStopsSubscription = null;

    return super.close();
  }

  void search() {
    if (state.departureBusStop != null &&
        state.arrivalBusStop != null &&
        state.tripDate != null) {}
  }

  void onDepartureChanged(BusStop departureBusStop) {
    emit(
      state.copyWith(departureBusStop: departureBusStop),
    );
  }

  void onArrivalChanged(BusStop arrivalBusStop) {
    emit(
      state.copyWith(arrivalBusStop: arrivalBusStop),
    );
  }

  void setTripDate(DateTime tripDate) {
    emit(
      state.copyWith(tripDate: tripDate),
    );
  }

  void _onNewStepanovBusStops(List<BusStop> busStops) {
    final suggestions = [...state.suggestions, ...busStops];

    emit(
      state.copyWith(stepanovBusStops: busStops, suggestions: suggestions),
    );
  }

  void _onNewAvtovasBusStops(List<BusStop> busStops) {
    final suggestions = [...state.suggestions, ...busStops];

    emit(
      state.copyWith(
        avtovasBusStops: busStops,
        suggestions: suggestions,
      ),
    );
  }
}
