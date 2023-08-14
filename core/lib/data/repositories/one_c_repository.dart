import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class OneCRepository implements IOneCRepository {
  final IOneCDataSource _oneCDataSource;

  OneCRepository(this._oneCDataSource) {
    getBusStops();
  }

  @override
  Stream<List<BusStop>> get avtovasBusStopsStream =>
      _oneCDataSource.avtovasBusStopsStream;

  @override
  Stream<List<BusStop>> get stepanovBusStopsStream =>
      _oneCDataSource.stepanovBusStopsStream;

  @override
  Stream<List<Trip>?> get tripsStream => _oneCDataSource.tripsStream;

  @override
  Stream<SingleTrip?> get singleTripStream => _oneCDataSource.singleTripStream;

  @override
  Future<void> getBusStops() {
    return _oneCDataSource.getBusStops();
  }

  @override
  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  }) {
    return _oneCDataSource.getTrips(
      departure: departure,
      destination: destination,
      tripsDate: tripsDate,
    );
  }

  @override
  Future<void> getTrip({
    required String tripId,
    required String busStop,
  }) async {
    return _oneCDataSource.getTrip(tripId: tripId, busStop: busStop);
  }

  @override
  void clearTrips() {
    _oneCDataSource.clearTrips();
  }

  @override
  void clearTrip () {
    _oneCDataSource.clearTrip();
  }
}
