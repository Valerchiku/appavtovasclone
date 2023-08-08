import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class SearchInteractor {
  final IOneCRepository _oneCRepository;

  SearchInteractor(this._oneCRepository);

  Stream<List<BusStop>> get busStopsStream => _oneCRepository.busStopsStream;

  Stream<List<Trip>> get tripsStream => _oneCRepository.tripsStream;

  Future<void> getTrips() {
    return _oneCRepository.getTrips();
  }
}
