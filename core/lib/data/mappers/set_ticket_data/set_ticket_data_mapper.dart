import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';
import 'package:core/data/mappers/set_ticket_data/set_ticket_data_ticket_mapper.dart';

final class SetTicketDataMapper implements BaseMapper<SetTicketData> {
  @override
  Map<String, dynamic> toJson(SetTicketData data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.tickets: data.tickets?.map(SetTicketDataTicketMapper().toJson).toList(),
    };
  }

  @override
  SetTicketData fromJson(Map<String, dynamic> json) {
    final tickets = json[_Fields.tickets];
    return SetTicketData(
      orderId: _Fields.orderId,
      tickets: tickets != null
          ? (tickets as List<dynamic>)
              .map((e) => SetTicketDataTicketMapper().fromJson(e))
              .toList()
          : List.empty(),
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String tickets = 'Tickets';
}
