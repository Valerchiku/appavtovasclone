import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_tickets/add_tickets_seat.dart';

final class AddTicketsSeatMapper implements BaseMapper<AddTicketsSeat> {
  @override
  Map<String, dynamic> toJson(AddTicketsSeat data) {
    return {
      _Fields.fareName: data.fareName,
      _Fields.seatNum: data.seatNum,
      _Fields.destination: data.destination,
      _Fields.ticketNumber: data.ticketNumber,
      _Fields.parentTicketSeatNum: data.parentTicketSeatNum,
    };
  }

  @override
  AddTicketsSeat fromJson(Map<String, dynamic> json) {
    return const AddTicketsSeat(
      fareName: _Fields.fareName,
      seatNum: _Fields.seatNum,
      destination: _Fields.destination,
      ticketNumber: _Fields.ticketNumber,
      parentTicketSeatNum: _Fields.parentTicketSeatNum,
    );
  }
}

abstract final class _Fields {
  static const String fareName = 'FareName';
  static const String seatNum = 'SeatNum';
  static const String destination = 'Destination';
  static const String ticketNumber = 'TicketNumber';
  static const String parentTicketSeatNum = 'ParentTicketSeatNum';
}
