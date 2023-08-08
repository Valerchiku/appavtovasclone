import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';

abstract interface class IOneCDataSource {
  Stream<List<BusStop>> get busStopsStream;

  Stream<List<Trip>> get tripsStream;

  Future<void> getBusStops();

  Future<void> getTrips();

  void clearBusStops();

  void clearTrips();
}
