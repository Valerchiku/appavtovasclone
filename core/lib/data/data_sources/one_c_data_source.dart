import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:rxdart/rxdart.dart';

final class OneCDataSource implements IOneCDataSource {
  final BehaviorSubject<List<BusStop>> _busStopsSubject = BehaviorSubject();
  final BehaviorSubject<List<Trip>> _tripsSubject = BehaviorSubject();

  @override
  Stream<List<BusStop>> get busStopsStream => _busStopsSubject;

  @override
  Stream<List<Trip>> get tripsStream => _tripsSubject;

  @override
  Future<void> getBusStops() async {
    _busStopsSubject.add(<BusStop>[]);
  }

  @override
  Future<void> getTrips() async {
    _tripsSubject.add([]);
  }

  @override
  void clearBusStops() {
    _busStopsSubject.add([]);
  }

  @override
  void clearTrips() {
    _tripsSubject.add([]);
  }
}
