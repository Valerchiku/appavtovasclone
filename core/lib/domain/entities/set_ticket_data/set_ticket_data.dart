import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/departure.dart';
import 'package:core/domain/entities/oneC_entities/destination.dart';
import 'package:core/domain/entities/oneC_entities/ticket.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';

final class SetTicketData extends DomainObject {
  final String number;
  final SingleTrip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final List<Ticket> tickets;
  final String amount;
  final String customer;
  final String services;
  final String secondsToUnlockSeats;
  final String reserve;
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
        tickets,
        amount,
        customer,
        services,
        secondsToUnlockSeats,
        reserve,
        currency,
      ];

  const SetTicketData({
    required this.number,
    required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.tickets,
    required this.amount,
    required this.customer,
    required this.services,
    required this.secondsToUnlockSeats,
    required this.reserve,
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
      tickets: tickets,
      amount: amount,
      customer: customer,
      services: services,
      secondsToUnlockSeats: secondsToUnlockSeats,
      reserve: reserve,
      currency: currency,
    );
  }
}
