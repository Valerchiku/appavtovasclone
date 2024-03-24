import 'package:core/avtovas_core.dart';

final class TripsScheduleInteractor {
  final IOneCRepository _oneCRepository;
  final IUserRepository _userRepository;
  final ICacheRepository _cacheRepository;

  TripsScheduleInteractor(
    this._oneCRepository,
    this._userRepository,
    this._cacheRepository,
  );

  bool get isAuth =>
      _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

  Stream<List<BusStop>?> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>?> get tripsStream => _oneCRepository.tripsStream;

  Stream<bool> get initializationStatusStream =>
      _oneCRepository.initializationStatusStream;

  User get user => _userRepository.entity;

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) {
    return _oneCRepository.getTrips(
      departure: departure,
      destination: destination,
      tripsDate: tripsDate,
    );
  }

  void clearTrips() {
    _oneCRepository.clearTrips();
  }

  Future<void> updateSearchHistory(List<String> history) async {
    if (!isAuth) return;

    final currentUser = _userRepository.entity;

    final newSearchHistory = [
      history,
      if (currentUser.searchHistory != null) ...currentUser.searchHistory!,
    ];

    final userWithNewSearchHistory = currentUser.copyWith(
      searchHistory: newSearchHistory,
      shouldClearSearchHistory: true,
    );

    return _userRepository.updateUser(userWithNewSearchHistory);
  }

  void setTripsScheduleArguments({
    required String lastSearchedDeparture,
    required String lastSearchArrival,
    required DateTime lastSearchedDate,
  }) {
    _cacheRepository.setTripsScheduleArguments(
      lastSearchedDeparture: lastSearchedDeparture,
      lastSearchArrival: lastSearchArrival,
      lastSearchedDate: lastSearchedDate,
    );
  }

  void setTripDetailsArguments({
    required String tripId,
    required String tripDepartureName,
    required String tripDestinationName,
  }) {
    _cacheRepository.setTripDetailsArguments(
      tripId: tripId,
      tripDepartureName: tripDepartureName,
      tripDestinationName: tripDestinationName,
    );
  }
}
