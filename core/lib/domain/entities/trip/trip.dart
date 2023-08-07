import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/trip/trip_bus.dart';
import 'package:core/domain/entities/trip/trip_carrier_data.dart';
import 'package:core/domain/entities/trip/trip_departure.dart';
import 'package:core/domain/entities/trip/trip_destination.dart';

final class Trip extends DomainObject {
  final String id;
  final String routeId;
  final String scheduleTripId;
  final String routeName;
  final String routeNum;
  final String carrier;
  final TripBus bus;
  final String? driver1;
  final String? driver2;
  final String frequency;
  final String? waybillNum;
  final String status;
  final String statusPrint;
  final String? statusReason;
  final String statusDate;
  final TripDeparture departure;
  final String departureTime;
  final String arrivalToDepartureTime;
  final TripDestination destination;
  final String arrivalTime;
  final String distance;
  final String duration;
  final String? transitSeats;
  final String freeSeatsAmount;
  final String passengerFareCost;
  final String platform;
  final String? onSale;
  final String additional;
  final String currency;
  final TripCarrierData carrierData;
  final String? checkMan;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        routeId,
        scheduleTripId,
        routeName,
        routeNum,
        carrier,
        bus,
        driver1,
        driver2,
        frequency,
        waybillNum,
        status,
        statusPrint,
        statusReason,
        statusDate,
        departure,
        departureTime,
        arrivalToDepartureTime,
        destination,
        arrivalTime,
        distance,
        duration,
        transitSeats,
        freeSeatsAmount,
        passengerFareCost,
        platform,
        onSale,
        additional,
        currency,
        carrierData,
        checkMan,
      ];

  const Trip({
    required this.id,
    required this.routeId,
    required this.scheduleTripId,
    required this.routeName,
    required this.routeNum,
    required this.carrier,
    required this.bus,
    required this.frequency,
    required this.status,
    required this.statusPrint,
    required this.statusDate,
    required this.departure,
    required this.departureTime,
    required this.arrivalToDepartureTime,
    required this.destination,
    required this.arrivalTime,
    required this.distance,
    required this.duration,
    required this.freeSeatsAmount,
    required this.passengerFareCost,
    required this.platform,
    required this.additional,
    required this.currency,
    required this.carrierData,
    this.driver1,
    this.driver2,
    this.waybillNum,
    this.statusReason,
    this.transitSeats,
    this.onSale,
    this.checkMan,
  });

  @override
  Trip copyWith() {
    return Trip(
      id: id,
      routeId: routeId,
      scheduleTripId: scheduleTripId,
      routeName: routeName,
      routeNum: routeNum,
      carrier: carrier,
      bus: bus,
      frequency: frequency,
      status: status,
      statusPrint: statusPrint,
      statusDate: statusDate,
      departure: departure,
      departureTime: departureTime,
      arrivalToDepartureTime: arrivalToDepartureTime,
      destination: destination,
      arrivalTime: arrivalTime,
      distance: distance,
      duration: duration,
      freeSeatsAmount: freeSeatsAmount,
      passengerFareCost: passengerFareCost,
      platform: platform,
      additional: additional,
      currency: currency,
      carrierData: carrierData,
      driver1: driver1,
      driver2: driver2,
      waybillNum: waybillNum,
      statusReason: statusReason,
      transitSeats: transitSeats,
      onSale: onSale,
      checkMan: checkMan,
    );
  }
}
