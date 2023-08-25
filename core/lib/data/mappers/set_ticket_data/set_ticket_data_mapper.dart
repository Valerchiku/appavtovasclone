import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';

final class SetTicketDataMapper implements BaseMapper<SetTicketData> {
  @override
  Map<String, dynamic> toJson(SetTicketData data) {
    return {
      _Fields.orderId: data.orderId,
      _Fields.tickets: data.tickets,
    };
  }

  @override
  SetTicketData fromJson(Map<String, dynamic> json) {
    return const SetTicketData(
      orderId: _Fields.orderId,
      tickets: _Fields.tickets,
    );
  }
}

abstract final class _Fields {
  static const String orderId = 'OrderId';
  static const String tickets = 'Tickets';
}
