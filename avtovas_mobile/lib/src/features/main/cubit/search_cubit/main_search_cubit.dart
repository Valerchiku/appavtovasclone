import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:collection/collection.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

part 'main_search_state.dart';

class MainSearchCubit extends Cubit<MainSearchState> {
  final SearchInteractor _searchInteractor;

  MainSearchCubit(this._searchInteractor)
      : super(
          const MainSearchState(
            route: CustomRoute(null, null),
            busStops: [],
            suggestions: [],
            searchHistory: [],
          ),
        ) {
    _subscribeAll();
  }

  StreamSubscription<User>? _userSubscription;
  StreamSubscription<List<BusStop>?>? _busStopsSubscription;

  void _subscribeAll() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = _searchInteractor.busStopsStream.listen(
      _onNewBusStops,
    );

    _userSubscription?.cancel();
    _userSubscription = _searchInteractor.userStream.listen(_onNewUser);
  }

  @override
  Future<void> close() {
    _busStopsSubscription?.cancel();
    _busStopsSubscription = null;

    _userSubscription?.cancel();
    _userSubscription = null;

    return super.close();
  }

  void search(VoidCallback onReset) {
    if (state.departurePlace != null &&
        state.arrivalPlace != null &&
        state.tripDate != null &&
        state.departurePlace!.isNotEmpty &&
        state.arrivalPlace!.isNotEmpty) {
      _navigateToSchedule();
      _resetMainPage(onReset);
    }
  }

  void clearSearchHistory() {
    _searchInteractor.clearSearchHistory();
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

  Future<void> _onNewUser(User user) async {
    if (user.uuid != '0' && user.uuid != '-1') {
      emit(
        state.copyWith(
          searchHistory: user.searchHistory ?? [],
        ),
      );
    }
  }

  void _navigateToSchedule() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          tripsScheduleConfig(
            departurePlace: state.departurePlace!,
            arrivalPlace: state.arrivalPlace!,
            tripDate: state.tripDate!,
          ),
          shouldClearStack: true,
        ),
      ),
    );
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

    final sortedSuggestions = busStopsSuggestions
      ?..whereMoveToTheFront(
        (suggestion) => suggestion.contains('АВ'),
      );

    emit(
      state.copyWith(
        busStops: busStops,
        suggestions: sortedSuggestions != null
            ? Set<String>.from(sortedSuggestions).toList()
            : null,
      ),
    );
  }

  void _resetMainPage(VoidCallback onReset) {
    onReset();

    emit(
      state.copyWith(
        clearTripDate: true,
        // ignore: avoid_redundant_argument_values
        tripDate: null,
        departurePlace: '',
        arrivalPlace: '',
        route: const CustomRoute(null, null),
      ),
    );
  }
}
