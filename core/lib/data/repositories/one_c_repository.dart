import 'package:core/data/data_sources/interfaces/i_one_c_data_source.dart';
import 'package:core/domain/entities/add_ticket/add_ticket.dart';
import 'package:core/domain/entities/add_ticket_return/add_ticket_return.dart';
import 'package:core/domain/entities/auxiliary_models/auxiliary_add_ticket.dart';
import 'package:core/domain/entities/auxiliary_models/personal_data.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_payment/one_c_payment.dart';
import 'package:core/domain/entities/reserve_order/reserve_order.dart';
import 'package:core/domain/entities/return_one_c_payment/return_one_c_payment.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_one_c_repository.dart';

final class OneCRepository implements IOneCRepository {
  final IOneCDataSource _oneCDataSource;

  OneCRepository(this._oneCDataSource);

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
  Stream<OneCPayment?> get oneCPaymentStream =>
      _oneCDataSource.oneCPaymentStream;

  @override
  Stream<AddTicketReturn?> get addTicketReturnStream =>
      _oneCDataSource.addTicketReturnStream;

  @override
  Stream<ReturnOneCPayment?> get returnOneCPaymentStream =>
      _oneCDataSource.returnOneCPaymentStream;

  @override
  String get dbName => _oneCDataSource.dbName;

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
    required String departure,
    required String destination,
  }) async {
    return _oneCDataSource.getTrip(
      tripId: tripId,
      departure: departure,
      destination: destination,
    );
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
  Future<void> delTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
  }) {
    return _oneCDataSource.delTickets(
      auxiliaryAddTicket: auxiliaryAddTicket,
      orderId: orderId,
    );
  }

  @override
  Future<void> addTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  }) async {
    return _oneCDataSource.addTickets(
      auxiliaryAddTicket: auxiliaryAddTicket,
      orderId: orderId,
      parentTicketSeatNum: parentTicketSeatNum,
    );
  }

  @override
  Future<String> setTicketData({
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
  Future<String> oneCPayment({
    required String dbName,
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    return _oneCDataSource.oneCPayment(
      dbName: dbName,
      orderId: orderId,
      paymentType: paymentType,
      amount: amount,
      terminalId: terminalId,
      terminalSessionId: terminalSessionId,
    );
  }

  @override
  Future<String> oneCCancelPayment({
    required String dbName,
    required String orderId,
    String? ticketSeats,
    String? services,
    String? paymentItems,
  }) {
    return _oneCDataSource.oneCCancelPayment(
      dbName: dbName,
      orderId: orderId,
      ticketSeats: ticketSeats,
      services: services,
      paymentItems: paymentItems,
    );
  }

  @override
  Future<String> addTicketReturn({
    required String dbName,
    required String ticketNumber,
    required String seatNum,
    required String departure,
  }) {
    return _oneCDataSource.addTicketReturn(
      dbName: dbName,
      ticketNumber: ticketNumber,
      seatNum: seatNum,
      departure: departure,
    );
  }

  @override
  Future<void> returnOneCPayment({
    required String dbName,
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) {
    return _oneCDataSource.returnOneCPayment(
      dbName: dbName,
      returnOrderId: returnOrderId,
      paymentType: paymentType,
      amount: amount,
      terminalId: terminalId,
      terminalSessionId: terminalSessionId,
    );
  }

  @override
  String getDbName() {
    return dbName;
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

  @override
  void clearOneCPayment() {
    _oneCDataSource.clearOneCPayment();
  }

  @override
  void clearAddTicketReturn() {
    _oneCDataSource.clearAddTicketReturn();
  }

  @override
  void clearReturnOneCPayment() {
    _oneCDataSource.clearReturnOneCPayment();
  }
}
