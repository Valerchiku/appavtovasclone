import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class OneCRepository implements IOneCRepository {
  final IOneCDataSource _oneCDataSource;

  OneCRepository(this._oneCDataSource) {
    getBusStops();
  }

  @override
  Stream<List<BusStop>> get busStopsStream => _oneCDataSource.busStopsStream;

  @override
  Stream<List<Trip>> get tripsStream => _oneCDataSource.tripsStream;

  @override
  Future<void> getBusStops() {
    return _oneCDataSource.getBusStops();
  }

  @override
  Future<void> getTrips() {
    return _oneCDataSource.getTrips();
  }
}
