import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket.dart';

final class SetTicketDataMapper implements BaseMapper<SetTicketData> {
  @override
  Map<String, dynamic> toJson(SetTicketData data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.tickets:
          data.tickets.map(SetTicketDataTicketMapper().toJson).toList(),
    };
  }

  @override
  SetTicketData fromJson(Map<String, dynamic> json) {
    final jsonTickets = json[_Fields.tickets];

    final tickets = <SetTicketDataTicket>[];

    if (jsonTickets is Map<String, dynamic>) {
      tickets.add(
        SetTicketDataTicketMapper().fromJson(jsonTickets),
      );
    } else if (jsonTickets is List<dynamic>) {
      tickets.addAll(
        jsonTickets.map(
          (el) => SetTicketDataTicketMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return SetTicketData(
      orderId: json[_Fields.orderId],
      tickets: tickets,
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String tickets = 'Tickets';
}
