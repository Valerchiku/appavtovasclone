import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class TripsScheduleInteractor {
  final IOneCRepository _oneCRepository;

  TripsScheduleInteractor(this._oneCRepository);

  Stream<List<BusStop>> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>> get tripsStream => _oneCRepository.tripsStream;

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
}
