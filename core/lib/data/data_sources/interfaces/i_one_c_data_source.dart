import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';

abstract interface class IOneCDataSource {
  Stream<List<BusStop>> get avtovasBusStopsStream;

  Stream<List<BusStop>> get stepanovBusStopsStream;

  Stream<List<Trip>?> get tripsStream;

  Future<void> getBusStops();

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  });

  void clearBusStops();

  void clearTrips();

}
