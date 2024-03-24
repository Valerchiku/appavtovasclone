import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/occupied_seat_mapper/occupied_seat_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/departure_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/destination_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/ticket_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/domain/entities/add_ticket/add_ticket.dart';

final class AddTicketMapper implements BaseMapper<AddTicket> {
  @override
  Map<String, dynamic> toJson(AddTicket data) {
    return {
      _Fields.number: data.number,
      _Fields.trip: data.trip,
      _Fields.departure: data.departure,
      _Fields.departureTime: data.departureTime,
      _Fields.destination: data.destination,
      _Fields.tickets: data.tickets.map(TicketMapper().toJson).toList(),
      _Fields.occupiedSeats:
          data.occupiedSeats.map(OccupiedSeatMapper().toJson).toList(),
      _Fields.amount: data.amount,
      _Fields.customer: data.customer,
      _Fields.services: data.services,
      _Fields.secondsToUnlockSeats: data.secondsToUnlockSeats,
      _Fields.reserve: data.reserve,
      _Fields.currency: data.currency,
    };
  }

  @override
  AddTicket fromJson(Map<String, dynamic> json) {
    final jsonTickets = json[_Fields.tickets];

    final jsonOccupiedSeats = json[_Fields.occupiedSeats];

    return AddTicket(
      number: json[_Fields.number] ?? '',
      trip: TripMapper().fromJson(json[_Fields.trip]),
      departure: DepartureMapper().fromJson(json[_Fields.departure]),
      departureTime: json[_Fields.departureTime] ?? '',
      destination: DestinationMapper().fromJson(json[_Fields.destination]),
      tickets: jsonTickets is List<dynamic>
          ? jsonTickets.map((e) => TicketMapper().fromJson(e)).toList()
          : [TicketMapper().fromJson(jsonTickets)],
      occupiedSeats: jsonOccupiedSeats is List<dynamic>
          ? jsonOccupiedSeats
              .map((e) => OccupiedSeatMapper().fromJson(e))
              .toList()
          : [OccupiedSeatMapper().fromJson(jsonOccupiedSeats)],
      amount: json[_Fields.amount] ?? '',
      customer: json[_Fields.customer] ?? '',
      services: json[_Fields.services] ?? '',
      secondsToUnlockSeats: json[_Fields.secondsToUnlockSeats] ?? '',
      reserve: json[_Fields.reserve] ?? '',
      currency: json[_Fields.currency] ?? '',
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
  static const String occupiedSeats = 'OccupiedSeats';
  static const String amount = 'Amount';
  static const String customer = 'Customer';
  static const String services = 'Services';
  static const String secondsToUnlockSeats = 'SecondsToUnlockSeats';
  static const String reserve = 'Reserve';
  static const String currency = 'Currency';
}
