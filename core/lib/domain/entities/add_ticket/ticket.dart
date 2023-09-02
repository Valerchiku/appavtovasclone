import 'package:core/domain/entities/add_ticket/add_ticket_calculation.dart';
import 'package:core/domain/entities/add_ticket/add_ticket_personal_data.dart';
import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/departure.dart';
import 'package:core/domain/entities/oneC_entities/destination.dart';

final class Ticket extends DomainObject {
  final String number;
  final String date;
  final String tripId;
  final String carrier;
  final String parentTicketSeatNum;
  final String seatType;
  final String seatNum;
  final String fareName;
  final String privilageName;
  final AddTicketCalculation calculation;
  final Departure departure;
  final String departureTime;
  final Destination destination;
  final String arrivalTime;
  final String distance;
  final String passengerName;
  final List<AddTicketPersonalData>? personalData;
  final String absence;
  final String faultDistance;
  final String faultCarrier;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        number,
        date,
        tripId,
        carrier,
        parentTicketSeatNum,
        seatType,
        seatNum,
        fareName,
        privilageName,
        calculation,
        departure,
        departureTime,
        destination,
        arrivalTime,
        distance,
        passengerName,
        personalData,
        absence,
        faultDistance,
        faultCarrier,
      ];

  const Ticket({
    required this.number,
    required this.date,
    required this.tripId,
    required this.carrier,
    required this.parentTicketSeatNum,
    required this.seatType,
    required this.seatNum,
    required this.fareName,
    required this.privilageName,
    required this.calculation,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.arrivalTime,
    required this.distance,
    required this.passengerName,
    required this.personalData,
    required this.absence,
    required this.faultDistance,
    required this.faultCarrier,
  });

  @override
  Ticket copyWith() {
    return Ticket(
      number: number,
      date: date,
      tripId: tripId,
      carrier: carrier,
      parentTicketSeatNum: parentTicketSeatNum,
      seatType: seatType,
      seatNum: seatNum,
      fareName: fareName,
      privilageName: privilageName,
      calculation: calculation,
      departure: departure,
      departureTime: departureTime,
      destination: destination,
      arrivalTime: arrivalTime,
      distance: distance,
      passengerName: passengerName,
      personalData: personalData,
      absence: absence,
      faultDistance: faultDistance,
      faultCarrier: faultCarrier,
    );
  }
}
