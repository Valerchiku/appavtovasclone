import 'dart:async';

import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final SearchInteractor _searchInteractor;

  MainCubit(this._searchInteractor)
      : super(
    const MainState(
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

  void search(VoidCallback onReset) {
    if (state.departurePlace != null &&
        state.arrivalPlace != null &&
        state.tripDate != null &&
        state.departurePlace!.isNotEmpty &&
        state.arrivalPlace!.isNotEmpty) {
      // TODO: navigate to schedule @glebDyakov 2023-08-22
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
}
