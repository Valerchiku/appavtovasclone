import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/utils/list_extension.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

final _f = <BusStop>[
  const BusStop(
    name: 'Казань АВ Кал',
    code: '111',
    id: '111',
    country: 'Россия',
    automated: 'true',
    hasDestinations: 'true',
    uTC: '1',
    gPSCoordinates: '13',
    region: 'Чувашская Республика',
    district: 'Асманский район',
  ),
  const BusStop(
    name: 'Казань АВ 13',
    code: '111',
    id: '111',
    country: 'Россия',
    automated: 'true',
    hasDestinations: 'true',
    uTC: '1',
    gPSCoordinates: '13',
    region: 'Чувашская Республика',
  ),
  const BusStop(
    name: 'Омск АВ Спаржский',
    code: '111',
    id: '111',
    country: 'Россия',
    automated: 'true',
    hasDestinations: 'true',
    uTC: '1',
    gPSCoordinates: '13',
    district: 'Асманский район',
  ),
  const BusStop(
    name: 'Омск АВ Идиотский',
    code: '111',
    id: '111',
    country: 'Россия',
    automated: 'true',
    hasDestinations: 'true',
    uTC: '1',
    gPSCoordinates: '13',
    district: 'Асманский район',
  ),
];

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
    final suggestions = _f.map(
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
  }

  Future<void> _tripsFromBusStops(List<BusStop> busStops) async {
    for (final busStop in busStops) {
      await _searchInteractor.getTrips();
    }
  }

  List<BusStop> _busStopsFromName() {
    final String departureName;
    if (state.departurePlace.contains(',')) {
      departureName = state.departurePlace.split(', ').first;
    } else {
      departureName = state.departurePlace;
    }

    final similarNames = _f
        .map((busStop) => busStop.name)
        .toList()
        .filterSimilarStrings(departureName)
      ..insert(0, departureName);

    return _f
        .where(
          (busStop) => similarNames.contains(busStop.name),
        )
        .toList();
  }
}
