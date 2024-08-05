import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/one_c_entities/bus.dart';
import 'package:core/domain/entities/one_c_entities/carrier_data.dart';
import 'package:core/domain/entities/one_c_entities/departure.dart';
import 'package:core/domain/entities/one_c_entities/destination.dart';

final class Trip extends DomainObject {
  final String id;
  final String routeId;
  final String scheduleTripId;
  final String routeName;
  final String routeNum;
  final String carrier;
  final Bus bus;
  final String? driver1;
  final String? driver2;
  final String frequency;
  final String? waybillNum;
  final String? status;
  final String? statusPrint;
  final String? statusReason;
  final String? statusComment;
  final String? statusDate;
  final Departure departure;
  final String departureTime;
  final String? arrivalToDepartureTime;
  final Destination destination;
  final String? arrivalTime;
  final String? distance;
  final String? duration;
  final String? transitSeats;
  final String? freeSeatsAmount;
  final String passengerFareCost;
  final String platform;
  final String? onSale;
  final String? additional;
  final String? saleStatus;
  final String? acbpdp;
  final String? currency;
  final CarrierData carrierData;
  final String? checkMan;
  final String dbName;

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
        transitSeats,
        freeSeatsAmount,
        passengerFareCost,
        platform,
        onSale,
        additional,
        saleStatus,
        acbpdp,
        currency,
        carrierData,
        checkMan,
        dbName,
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
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.platform,
    required this.currency,
    required this.carrierData,
    required this.passengerFareCost,
    required this.dbName,
    this.driver1,
    this.driver2,
    this.waybillNum,
    this.status,
    this.statusComment,
    this.statusPrint,
    this.statusDate,
    this.arrivalToDepartureTime,
    this.arrivalTime,
    this.distance,
    this.duration,
    this.freeSeatsAmount,
    this.additional,
    this.saleStatus,
    this.acbpdp,
    this.statusReason,
    this.transitSeats,
    this.onSale,
    this.checkMan,
  });

  const Trip.error()
      : id = '',
        routeId = '',
        scheduleTripId = '',
        routeName = '',
        routeNum = '',
        carrier = '',
        dbName = '',
        bus = const Bus(
          id: '',
          model: '',
          licencePlate: '',
          name: '',
          seatsClass: '',
          seatCapacity: '',
          standCapacity: '',
          baggageCapacity: '',
          garageNum: '',
        ),
        frequency = '',
        departureTime = '',
        destination = const Destination(
          name: '',
          code: '',
          id: '',
          country: '',
          automated: '',
          hasDestinations: '',
          uTC: '',
          gPSCoordinates: '',
        ),
        departure = const Departure(
          name: '',
          code: '',
          id: '',
          country: '',
          automated: '',
          hasDestinations: '',
          uTC: '',
          gPSCoordinates: '',
        ),
        platform = '',
        currency = '',
        carrierData = const CarrierData(
          carrierName: '',
          carrierTaxId: '',
          carrierStateRegNum: '',
          carrierPersonalData: [],
          carrierAddress: '',
          carrierWorkingHours: '',
        ),
        passengerFareCost = '',
        driver1 = null,
        driver2 = null,
        waybillNum = null,
        status = null,
        statusComment = null,
        statusPrint = null,
        statusDate = null,
        arrivalToDepartureTime = null,
        arrivalTime = null,
        distance = null,
        duration = null,
        freeSeatsAmount = null,
        additional = null,
        saleStatus = null,
        acbpdp = null,
        statusReason = null,
        transitSeats = null,
        onSale = null,
        checkMan = null;

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
      dbName: dbName,
      frequency: frequency,
      status: status,
      statusComment: statusComment,
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
      saleStatus: saleStatus,
      acbpdp: acbpdp,
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
