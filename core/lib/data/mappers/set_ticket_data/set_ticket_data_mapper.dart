import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/departure_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/destination_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/data/mappers/ticket/ticket_mapper.dart';
import 'package:core/domain/entities/oneC_entities/ticket.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data.dart';

final class SetTicketDataMapper implements BaseMapper<SetTicketData> {
  @override
  Map<String, dynamic> toJson(SetTicketData data) {
    return {
      _Fields.number: data.number,
      _Fields.trip: data.trip,
      _Fields.departure: data.departure,
      _Fields.departureTime: data.departureTime,
      _Fields.destination: data.destination,
      _Fields.tickets: data.tickets?.map(TicketMapper().toJson).toList(),
      _Fields.amount: data.amount,
      _Fields.customer: data.customer,
      _Fields.services: data.services,
      _Fields.secondsToUnlockSeats: data.secondsToUnlockSeats,
      _Fields.reserve: data.reserve,
      _Fields.currency: data.currency,
    };
  }

  @override
  SetTicketData fromJson(Map<String, dynamic> json) {
    final jsonTickets = json[_Fields.tickets];

    final tickets = <Ticket>[];

    if (jsonTickets is Map<String, dynamic>) {
      tickets.add(
        TicketMapper().fromJson(jsonTickets),
      );
    } else if (jsonTickets is List<dynamic>) {
      tickets.addAll(
        jsonTickets.map(
          (el) => TicketMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }

    return SetTicketData(
      number: _Fields.number,
      trip: SingleTripMapper().fromJson(json[_Fields.trip]),
      departure: DepartureMapper().fromJson(json[_Fields.departure]),
      departureTime: _Fields.departureTime,
      destination: DestinationMapper().fromJson(json[_Fields.destination]),
      tickets: tickets != null
          ? (tickets as List<dynamic>)
              .map((e) => TicketMapper().fromJson(e))
              .toList()
          : List.empty(),
      amount: _Fields.amount,
      customer: _Fields.customer,
      services: _Fields.services,
      secondsToUnlockSeats: _Fields.secondsToUnlockSeats,
      reserve: _Fields.reserve,
      currency: _Fields.currency,
    );
  }
}

abstract final class _Fields {
  static const String number = 'Number';
  static const String trip = 'Trip';
  static const String departure = 'Departure';
  static const String departureTime = 'DepartureTime';
  static const String destination = 'Destination';
  static const String tickets = 'Tickets';
  static const String amount = 'Amount';
  static const String customer = 'Customer';
  static const String services = 'Services';
  static const String secondsToUnlockSeats = 'SecondsToUnlockSeats';
  static const String reserve = 'Reserve';
  static const String currency = 'Currency';
}
