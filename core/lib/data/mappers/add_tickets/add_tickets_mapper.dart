import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_tickets/add_tickets.dart';
import 'package:core/data/mappers/add_tickets/add_tickets_seat_mapper.dart';

final class AddTicketsMapper implements BaseMapper<AddTickets> {
  @override
  Map<String, dynamic> toJson(AddTickets data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.ticketSeats:
          data.ticketSeats?.map(AddTicketsSeatMapper().toJson).toList(),
    };
  }

  @override
  AddTickets fromJson(Map<String, dynamic> json) {
    final ticketSeats = json[_Fields.ticketSeats];
    return AddTickets(
      orderId: _Fields.orderId,
      ticketSeats: ticketSeats != null
          ? (ticketSeats as List<dynamic>)
              .map((e) => AddTicketsSeatMapper().fromJson(e))
              .toList()
          : List.empty(),
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String ticketSeats = 'TicketSeats';
}
