import 'package:core/domain/entities/domain_object.dart';

final class Payment extends DomainObject {
  /*final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  // TODO: Edit ticket model
  final Ticket ticket
  final List<OccupiedSeats> occupiedSeats;
  final String amount;
  final String services;
  final String currency;
  */
  @override
  List<Object?> get props => [
        /*
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
     */
      ];

  const Payment(
      /*{
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
      } */
      );

  @override
  Payment copyWith() {
    return const Payment(
        /*
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
       */
        );
  }
}
