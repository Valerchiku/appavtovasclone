import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/trip/trip.dart';

abstract interface class IOneCDataSource {

  Stream<List<BusStop>> get avtovasBusStopsStream;

  Stream<List<BusStop>> get stepanovBusStopsStream;

  Stream<List<Trip>?> get tripsStream;

  Stream<SingleTrip?> get singleTripStream;

  Future<void> getBusStops();

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  });

  Future<void> getTrip({
    required String tripId,
    required String busStop,
  });

  void clearBusStops();

  void clearTrips();

  void clearTrip();
}
