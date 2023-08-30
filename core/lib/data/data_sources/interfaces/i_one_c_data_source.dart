import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/entities/trip/trip.dart';

abstract interface class IOneCDataSource {
  Stream<List<BusStop>?> get busStopsStream;

  Stream<List<Trip>?> get tripsStream;

  Stream<SingleTrip?> get singleTripStream;

  Stream<StartSaleSession?> get saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeat;

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

  Future<void> startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  });

  Future<void> getOccupiedSeat({
    required String tripId,
    required String departure,
    required String destination,
  });

  void clearBusStop();

  void clearTrips();

  void clearTrip();

  void clearSession();

  void clearOccupiedSeat();
}
