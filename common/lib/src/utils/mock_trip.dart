import 'package:equatable/equatable.dart';

final class MockTrip extends Equatable {
  final String ticketPrice;
  final String tripNumber;
  final String freePlaces;
  final String tripRoot;
  final String timeInRoad;
  final String departurePlace;
  final String arrivalPlace;
  final String departureTime;
  final String departureDate;
  final String arrivalDate;
  final String arrivalTime;
  final List<String> waypoints;
  final String carrier;
  final String transport;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        ticketPrice,
        tripNumber,
        freePlaces,
        tripRoot,
        timeInRoad,
        departurePlace,
        arrivalPlace,
        departureTime,
        departureDate,
        arrivalTime,
        arrivalDate,
        waypoints,
        carrier,
        transport,
      ];

  const MockTrip({
    required this.ticketPrice,
    required this.tripNumber,
    required this.freePlaces,
    required this.tripRoot,
    required this.timeInRoad,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.departureTime,
    required this.departureDate,
    required this.arrivalTime,
    required this.arrivalDate,
    required this.waypoints,
    required this.carrier,
    required this.transport,
  });
}
