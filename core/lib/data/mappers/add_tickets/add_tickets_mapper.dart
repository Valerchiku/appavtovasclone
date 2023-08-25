import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';

final class AddTicketsMapper implements BaseMapper<AddTickets> {
  @override
  Map<String, dynamic> toJson(AddTickets data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.fareName: data.fareName,
      _Fields.seatNum: data.seatNum,
      _Fields.destination: data.destination,
      _Fields.ticketNumber: data.ticketNumber,
      _Fields.parentTicketSeatNum: data.parentTicketSeatNum,
    };
  }

  @override
  AddTickets fromJson(Map<String, dynamic> json) {
    return const AddTickets(
      orderId: _Fields.orderId,
      fareName: _Fields.fareName,
      seatNum: _Fields.seatNum,
      destination: _Fields.destination,
      ticketNumber: _Fields.ticketNumber,
      parentTicketSeatNum: _Fields.parentTicketSeatNum,
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String fareName = 'FareName';
  static const String seatNum = 'SeatNum';
  static const String destination = 'Destination';
  static const String ticketNumber = 'TicketNumber';
  static const String parentTicketSeatNum = 'ParentTicketSeatNum';
}
