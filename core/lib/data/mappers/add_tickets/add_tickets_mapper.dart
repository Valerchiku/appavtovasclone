import 'package:core/data/mappers/add_tickets/add_tickets_seat_mapper.dart';
import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/add_tickets/add_tickets.dart';
import 'package:core/domain/entities/add_tickets/add_tickets_seat.dart';

final class AddTicketsMapper implements BaseMapper<AddTickets> {
  @override
  Map<String, dynamic> toJson(AddTickets data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.ticketSeats:
          data.ticketSeats.map(AddTicketsSeatMapper().toJson).toList(),
    };
  }

  @override
  AddTickets fromJson(Map<String, dynamic> json) {
    final jsonTicketSeats = json[_Fields.ticketSeats];

    final ticketSeats = <AddTicketsSeat>[];

    if (jsonTicketSeats is Map<String, dynamic>) {
      ticketSeats.add(
        AddTicketsSeatMapper().fromJson(jsonTicketSeats),
      );
    } else if (jsonTicketSeats is List<dynamic>) {
      ticketSeats.addAll(
        jsonTicketSeats.map(
          (el) => AddTicketsSeatMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    return AddTickets(
      orderId: _Fields.orderId,
      ticketSeats: ticketSeats,
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String ticketSeats = 'TicketSeats';
}
