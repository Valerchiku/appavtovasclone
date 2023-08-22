import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/trip/trip_departure.dart';
import 'package:core/domain/entities/trip/trip_destination.dart';

class StartSaleSession extends DomainObject {
  final String number;
  // final SingleTrip trip;
  final TripDeparture departure;
  final String departureTime;
  final TripDestination destination;
  final String amount;
  final String services;
  final String currency;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        number,
        // trip,
        departure,
        departureTime,
        destination,
        amount,
        services,
        currency,
      ];
  const StartSaleSession({
    required this.number,
    // required this.trip,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.amount,
    required this.services,
    required this.currency,
  });

  @override
  StartSaleSession copyWith() {
    return StartSaleSession(
      number: number,
      // trip: trip,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      amount: amount,
      services: services,
      currency: currency,
    );
  }
}
