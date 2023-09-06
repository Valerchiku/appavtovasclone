import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/domain/entities/add_ticket/add_ticket.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/oneC_entities/personal_data.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class OneCRepository implements IOneCRepository {
  final IOneCDataSource _oneCDataSource;

  OneCRepository(this._oneCDataSource) {
    getBusStops();
  }

  @override
  Stream<List<BusStop>?> get busStopsStream => _oneCDataSource.busStopsStream;

  @override
  Stream<List<Trip>?> get tripsStream => _oneCDataSource.tripsStream;

  @override
  Stream<SingleTrip?> get singleTripStream => _oneCDataSource.singleTripStream;

  @override
  Stream<StartSaleSession?> get saleSessionStream =>
      _oneCDataSource.saleSessionStream;

  @override
  Stream<List<OccupiedSeat>?> get occupiedSeatStream =>
      _oneCDataSource.occupiedSeat;

  @override
  Stream<AddTicket?> get addTicketsStream => _oneCDataSource.addTicketsStream;

  @override
  Stream<SetTicketData?> get setTicketDataStream =>
      _oneCDataSource.setTicketDataStream;

  @override
  Stream<ReserveOrder?> get reserveOrderStream =>
      _oneCDataSource.reserveOrderStream;

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
  Future<void> startSaleSession({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    return _oneCDataSource.startSaleSession(
      tripId: tripId,
      departure: departure,
      destination: destination,
    );
  }

  @override
  Future<void> getOccupiedSeat({
    required String tripId,
    required String departure,
    required String destination,
  }) async {
    return _oneCDataSource.getOccupiedSeat(
      tripId: tripId,
      departure: departure,
      destination: destination,
    );
  }

  @override
  Future<void> addTickets({
    required String orderId,
    required String fareName,
    required String seatNum,
    String? parentTicketSeatNum,
  }) async {
    return _oneCDataSource.addTickets(
      orderId: orderId,
      fareName: fareName,
      seatNum: seatNum,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }

  @override
  Future<void> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  }) {
    return _oneCDataSource.setTicketData(
      orderId: orderId,
      personalData: personalData,
    );
  }

  @override
  Future<void> reserveOrder({
    required String orderId,
    String? name,
    String? phone,
    String? email,
    String? comment,
  }) {
    return _oneCDataSource.reserveOrder(
      orderId: orderId,
      name: name,
      phone: phone,
      email: email,
      comment: comment,
    );
  }

  @override
  void clearTrips() {
    _oneCDataSource.clearTrips();
  }

  @override
  void clearTrip() {
    _oneCDataSource.clearTrip();
  }

  @override
  void clearSession() {
    _oneCDataSource.clearSession();
  }

  @override
  void clearOccupiedSeat() {
    _oneCDataSource.clearOccupiedSeat();
  }

  @override
  void clearAddTickets() {
    _oneCDataSource.clearAddTickets();
  }

  @override
  void clearSetTicketData() {
    _oneCDataSource.clearSetTicketData();
  }

  @override
  void clearReserveOrder() {
    _oneCDataSource.clearReserveOrder();
  }
}
