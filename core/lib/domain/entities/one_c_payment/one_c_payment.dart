import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_entities/departure.dart';
import 'package:core/domain/entities/one_c_entities/destination.dart';
import 'package:core/domain/entities/one_c_entities/ticket.dart';
import 'package:core/domain/entities/trip/trip.dart';

final class OneCPayment extends DomainObject {
  final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final List<Ticket> ticket;
  final List<OccupiedSeat> occupiedSeats;
  final String amount;
  final String services;
  final String currency;

  @override
  List<Object?> get props => [
        number,
        trip,
        departure,
        departureTime,
        destination,
        ticket,
        occupiedSeats,
        amount,
        services,
        currency,
      ];

  const OneCPayment({
    required this.number,
    required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.ticket,
    required this.occupiedSeats,
    required this.amount,
    required this.services,
    required this.currency,
  });

  @override
  OneCPayment copyWith() {
    return OneCPayment(
      number: number,
      trip: trip,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      ticket: ticket,
      occupiedSeats: occupiedSeats,
      amount: amount,
      services: services,
      currency: currency,
    );
  }
}
