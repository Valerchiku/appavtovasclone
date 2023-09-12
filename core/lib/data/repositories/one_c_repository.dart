import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/add_ticket_return/add_ticket_return.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/payment/payment.dart';
import 'package:core/domain/entities/return_payment/return_payment.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/start_sale_session/start_sale_session.dart';

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
  Stream<Payment?> get paymentStream => _oneCDataSource.paymentStream;

  @override
  Stream<AddTicketReturn?> get addTicketReturnStream =>
      _oneCDataSource.addTicketReturnStream;

  @override
  Stream<ReturnPayment?> get returnPaymentStream =>
      _oneCDataSource.returnPaymentStream;

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
  Future<void> payment({
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) async {
    return _oneCDataSource.payment(
      orderId: orderId,
      paymentType: paymentType,
      amount: amount,
      terminalId: terminalId,
      terminalSessionId: terminalSessionId,
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
  Future<void> addTicketReturn({
    required String ticketNumber,
    required String seatNum,
    required String departure,
  }) {
    return _oneCDataSource.addTicketReturn(
      ticketNumber: ticketNumber,
      seatNum: seatNum,
      departure: departure,
    );
  }

  @override
  Future<void> returnPayment({
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  }) {
    return _oneCDataSource.returnPayment(
      returnOrderId: returnOrderId,
      paymentType: paymentType,
      amount: amount,
      terminalId: terminalId,
      terminalSessionId: terminalSessionId,
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

  @override
  void clearPayment() {
    _oneCDataSource.clearPayment();
  }

  @override
  void clearAddTicketReturn() {
    _oneCDataSource.clearAddTicketReturn();
  }

  @override
  void clearReturnPayment() {
    _oneCDataSource.clearReturnPayment();
  }
}
