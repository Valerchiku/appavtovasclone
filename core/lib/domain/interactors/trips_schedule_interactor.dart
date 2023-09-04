import 'package:core/avtovas_core.dart';

final class TripsScheduleInteractor {
  final IOneCRepository _oneCRepository;
  final IUserRepository _userRepository;

  TripsScheduleInteractor(
    this._oneCRepository,
    this._userRepository,
  );

  bool get isAuth =>
      _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

  Stream<List<BusStop>?> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>?> get tripsStream => _oneCRepository.tripsStream;

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
}
