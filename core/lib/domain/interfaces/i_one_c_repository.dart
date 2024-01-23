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

abstract interface class IOneCRepository {
  Stream<List<BusStop>?> get busStopsStream;

  Stream<List<Trip>?> get tripsStream;

  Stream<SingleTrip?> get singleTripStream;

  Stream<StartSaleSession?> get saleSessionStream;

  Stream<List<OccupiedSeat>?> get occupiedSeatStream;

  Stream<AddTicket?> get addTicketsStream;

  Stream<SetTicketData?> get setTicketDataStream;

  Stream<ReserveOrder?> get reserveOrderStream;

  Stream<OneCPayment?> get oneCPaymentStream;

  Stream<AddTicketReturn?> get addTicketReturnStream;

  Stream<ReturnOneCPayment?> get returnOneCPaymentStream;

  String get dbName;

  Future<void> getBusStops();

  Future<void> getTrips({
    required String departure,
    required String destination,
    required String tripsDate,
  });

  Future<void> getTrip({
    required String tripId,
    required String departure,
    required String destination,
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

  Future<void> delTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
  });

  Future<void> addTickets({
    required List<AuxiliaryAddTicket> auxiliaryAddTicket,
    required String orderId,
    String? parentTicketSeatNum,
  });

  Future<String> setTicketData({
    required String orderId,
    required List<PersonalData> personalData,
  });

  Future<void> reserveOrder({
    required String orderId,
    String? name,
    String? phone,
    String? email,
    String? comment,
  });

  Future<String> oneCPayment({
    required String dbName,
    required String orderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  });

  Future<String> oneCCancelPayment({
    required String dbName,
    required String orderId,
    String? ticketSeats,
    String? services,
    String? paymentItems,
  });

  Future<String> addTicketReturn({
    required String dbName,
    required String ticketNumber,
    required String seatNum,
    required String departure,
  });

  Future<void> returnOneCPayment({
    required String dbName,
    required String returnOrderId,
    required String paymentType,
    required String amount,
    String? terminalId,
    String? terminalSessionId,
  });

  String getDbName() {
    return dbName;
  }

  void clearTrips();

  void clearTrip();

  void clearSession();

  void clearOccupiedSeat();

  void clearAddTickets();

  void clearSetTicketData();

  void clearReserveOrder();

  void clearOneCPayment();

  void clearAddTicketReturn();

  void clearReturnOneCPayment();
}
