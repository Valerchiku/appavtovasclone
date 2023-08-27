import 'package:core/data/mappers/base_mapper.dart';

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
    return const AddTickets(
      orderId: _Fields.orderId,
      ticketSeats: ticketSeats != null
          ? (ticketSeats as List<dynamic>)
              .map((e) => AddTicketsSeatMapper().fromJson(e))
              .toList()
          : null,
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String ticketSeats = 'TicketSeats';
}
