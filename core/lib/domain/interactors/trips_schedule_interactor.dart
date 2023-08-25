import 'package:core/avtovas_core.dart';

final class TripsScheduleInteractor {
  final IOneCRepository _oneCRepository;

  TripsScheduleInteractor(this._oneCRepository);

  Stream<List<BusStop>?> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>?> get tripsStream => _oneCRepository.tripsStream;

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
}
