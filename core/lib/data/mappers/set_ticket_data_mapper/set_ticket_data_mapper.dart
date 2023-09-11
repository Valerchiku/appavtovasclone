import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/departure_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/destination_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/ticket_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';

final class SetTicketDataMapper implements BaseMapper<SetTicketData> {
  @override
  Map<String, dynamic> toJson(SetTicketData data) {
    return {
      _Fields.number: data.number,
      _Fields.trip: TripMapper().toJson(data.trip),
      _Fields.departure: DepartureMapper().toJson(data.departure),
      _Fields.departureTime: data.departureTime,
      _Fields.destination: DestinationMapper().toJson(data.destination),
      _Fields.ticket:
          data.ticket.map((ticket) => TicketMapper().toJson(ticket)).toList(),
      _Fields.amount: data.amount,
      _Fields.services: data.services,
      _Fields.currency: data.currency,
    };
  }

  @override
  SetTicketData fromJson(Map<String, dynamic> json) {
    final jsonTickets = json[_Fields.ticket];

    return SetTicketData(
      number: json[_Fields.number] ?? '',
      trip: TripMapper().fromJson(json[_Fields.trip]),
      departure: DepartureMapper().fromJson(json[_Fields.departure]),
      departureTime: json[_Fields.departureTime] ?? '',
      destination: DestinationMapper().fromJson(json[_Fields.destination]),
      ticket: jsonTickets is List<dynamic>
          ? jsonTickets.map((e) => TicketMapper().fromJson(e)).toList()
          : [TicketMapper().fromJson(jsonTickets),],
      amount: json[_Fields.amount] ?? '',
      services: json[_Fields.services] ?? '',
      currency: json[_Fields.currency] ?? '',
    );
  }
}

abstract final class _Fields {
  static const number = 'Number';
  static const trip = 'Trip';
  static const departure = 'Departure';
  static const departureTime = 'DepartureTime';
  static const destination = 'Destination';
  static const ticket = 'Tickets';
  static const amount = 'Amount';
  static const services = 'Services';
  static const currency = 'Currency';
}
