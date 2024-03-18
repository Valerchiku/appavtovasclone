import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:common/avtovas_utils.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            pageLoading: false,
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
      _searchInteractor.clearTripsSubject();
      _navigateToSchedule();
      _resetMainPage(onReset);
    }
  }

  Future<void> clearSearchHistory() async {
    emit(
      state.copyWith(pageLoading: true),
    );

    await _searchInteractor.clearSearchHistory();

    Future.delayed(
      const Duration(milliseconds: 300),
      () => emit(state.copyWith(pageLoading: false)),
    );
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
    final busStopsSuggestions = busStops
        ?.map(
          (busStop) => [
            busStop.name,
            if (busStop.district?.isNotEmpty ?? false) busStop.district,
            if (busStop.region?.isNotEmpty ?? false) busStop.region,
          ].where((value) => value != null).join(', '),
        )
        .toList()
      ?..sort();

    if (busStopsSuggestions != null) {
      for (final comparator in stationComparators) {
        busStopsSuggestions.whereMoveToTheFront(
          (busStop) => basicBusStopComparator(busStop, comparator),
        );
      }

      for (final comparator in cityComparators) {
        busStopsSuggestions.whereMoveToTheFront(
          (busStop) => basicBusStopComparator(busStop, comparator),
        );
      }
    }

    emit(
      state.copyWith(
        busStops: busStops,
        suggestions: busStopsSuggestions != null
            ? Set<String>.from(busStopsSuggestions).toList()
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
