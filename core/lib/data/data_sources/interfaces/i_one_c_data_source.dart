import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';

abstract interface class IOneCDataSource {
  Stream<List<BusStop>> get busStopsStream;

  Stream<List<Trip>> get tripsStream;

  // Stream<List<SingleTrip>> get singleTripSteam;

  Future<void> getBusStops();

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  });

  // Future<void> getTrip({
  //   required String tripId,
  //   required String busStop,
  // });

  void clearBusStops();

  void clearTrips();

  // void clearSingleTrip();
}
