import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/oneC_entities/bus.dart';
import 'package:core/domain/entities/oneC_entities/carrier_data.dart';
import 'package:core/domain/entities/oneC_entities/departure.dart';
import 'package:core/domain/entities/oneC_entities/destination.dart';
import 'package:core/domain/entities/single_trip/single_trip_route.dart';

final class SingleTrip extends DomainObject {
  final String id;
  final String routeId;
  final String scheduleTripId;
  final String routeName;
  final String routeNum;
  final String carrier;
  final Bus bus;
  final String driver1;
  final String driver2;
  final String frequency;
  final String waybillNum;
  final String status;
  final String statusPrint;
  final String statusReason;
  final String statusComment;
  final String statusDate;
  final Departure departure;
  final String departureTime;
  final String arrivalToDepartureTime;
  final Destination destination;
  final String arrivalTime;
  final String distance;
  final String duration;
  final String transitSeat;
  final String freeSeatsAmount;
  final String passengerFareCost;
  final SingleTrip fares;
  final String platform;
  final String onSale;
  final SingleTripRoute route;
  final String additional;
  final String saleStatus;
  final String acbpdp;
  final String currency;
  final CarrierData carrierData;

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
        statusComment,
        statusDate,
        departure,
        departureTime,
        arrivalToDepartureTime,
        destination,
        arrivalTime,
        distance,
        duration,
        transitSeat,
        freeSeatsAmount,
        passengerFareCost,
        fares,
        platform,
        onSale,
        route,
        additional,
        saleStatus,
        acbpdp,
        currency,
        carrierData,
      ];

  const SingleTrip({
    required this.id,
    required this.routeId,
    required this.scheduleTripId,
    required this.routeName,
    required this.routeNum,
    required this.carrier,
    required this.bus,
    required this.driver1,
    required this.driver2,
    required this.frequency,
    required this.waybillNum,
    required this.status,
    required this.statusPrint,
    required this.statusReason,
    required this.statusComment,
    required this.statusDate,
    required this.departure,
    required this.departureTime,
    required this.arrivalToDepartureTime,
    required this.destination,
    required this.arrivalTime,
    required this.distance,
    required this.duration,
    required this.transitSeat,
    required this.freeSeatsAmount,
    required this.passengerFareCost,
    required this.fares,
    required this.platform,
    required this.onSale,
    required this.route,
    required this.additional,
    required this.saleStatus,
    required this.acbpdp,
    required this.currency,
    required this.carrierData,
  });

  @override
  SingleTrip copyWith() {
    return SingleTrip(
      id: id,
      routeId: routeId,
      scheduleTripId: scheduleTripId,
      routeName: routeName,
      routeNum: routeNum,
      carrier: carrier,
      bus: bus,
      driver1: driver1,
      driver2: driver2,
      frequency: frequency,
      waybillNum: waybillNum,
      status: status,
      statusPrint: statusPrint,
      statusReason: statusReason,
      statusComment: statusComment,
      statusDate: statusDate,
      departure: departure,
      departureTime: departureTime,
      arrivalToDepartureTime: arrivalToDepartureTime,
      destination: destination,
      arrivalTime: arrivalTime,
      distance: distance,
      duration: duration,
      transitSeat: transitSeat,
      freeSeatsAmount: freeSeatsAmount,
      passengerFareCost: passengerFareCost,
      fares: fares,
      platform: platform,
      onSale: onSale,
      route: route,
      additional: additional,
      saleStatus: saleStatus,
      acbpdp: acbpdp,
      currency: currency,
      carrierData: carrierData,
    );
  }
}
