import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/one_c_entities/departure.dart';
import 'package:core/domain/entities/one_c_entities/destination.dart';
import 'package:core/domain/entities/one_c_entities/ticket.dart';
import 'package:core/domain/entities/reserve_order/reserve_order_customer.dart';
import 'package:core/domain/entities/reserve_order/reserve_order_reserve.dart';

final class ReserveOrder extends DomainObject {
  final String number;
  final Trip trip;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final List<Ticket> ticket;
  final List<OccupiedSeat> occupiedSeat;
  final String amount;
  final ReserveOrderCustomer customer;
  final String services;
  final String secondsToUnlockSeats;
  final ReserveOrderReserve reserve;
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
        occupiedSeat,
        amount,
        customer,
        services,
        secondsToUnlockSeats,
        reserve,
        currency,
      ];

  const ReserveOrder({
    required this.number,
    required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.ticket,
    required this.occupiedSeat,
    required this.amount,
    required this.customer,
    required this.services,
    required this.secondsToUnlockSeats,
    required this.reserve,
    required this.currency,
  });

  @override
  ReserveOrder copyWith() {
    return ReserveOrder(
      number: number,
      trip: trip,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      ticket: ticket,
      occupiedSeat: occupiedSeat,
      amount: amount,
      customer: customer,
      services: services,
      secondsToUnlockSeats: secondsToUnlockSeats,
      reserve: reserve,
      currency: currency,
    );
  }
}
