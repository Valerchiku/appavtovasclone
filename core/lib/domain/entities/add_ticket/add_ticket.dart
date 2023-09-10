import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/oneC_entities/departure.dart';
import 'package:core/domain/entities/oneC_entities/destination.dart';
import 'package:core/domain/entities/oneC_entities/ticket.dart';
import 'package:core/domain/entities/trip/trip.dart';

final class AddTicket extends DomainObject {
  final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final List<Ticket> tickets;
  final List<OccupiedSeat> occupiedSeats;
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
        occupiedSeats,
        amount,
        customer,
        services,
        secondsToUnlockSeats,
        reserve,
        currency,
      ];

  const AddTicket({
    required this.number,
    required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.tickets,
    required this.occupiedSeats,
    required this.amount,
    required this.customer,
    required this.services,
    required this.secondsToUnlockSeats,
    required this.reserve,
    required this.currency,
  });

  @override
  AddTicket copyWith() {
    return AddTicket(
      number: number,
      trip: trip,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      tickets: tickets,
      occupiedSeats: occupiedSeats,
      amount: amount,
      customer: customer,
      services: services,
      secondsToUnlockSeats: secondsToUnlockSeats,
      reserve: reserve,
      currency: currency,
    );
  }
}
