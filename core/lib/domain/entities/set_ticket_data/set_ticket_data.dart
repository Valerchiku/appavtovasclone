import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/departure.dart';
import 'package:core/domain/entities/one_c_entities/destination.dart';
import 'package:core/domain/entities/one_c_entities/ticket.dart';
import 'package:core/domain/entities/trip/trip.dart';

final class SetTicketData extends DomainObject {
  final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final List<Ticket> ticket;
  final String amount;
  final String services;
  final String currency;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        number,
        trip,
        departure,
        departureTime,
        destination,
        ticket,
        amount,
        services,
        currency,
      ];

  @override
  const SetTicketData({
    required this.number,
    required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.ticket,
    required this.amount,
    required this.services,
    required this.currency,
  });

  @override
  SetTicketData copyWith() {
    return SetTicketData(
      number: number,
      trip: trip,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      ticket: ticket,
      amount: amount,
      services: services,
      currency: currency,
    );
  }
}
