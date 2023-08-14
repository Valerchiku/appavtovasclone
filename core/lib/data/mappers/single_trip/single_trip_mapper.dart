import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';

final class SingleTripMapper implements BaseMapper<SingleTrip> {
  @override
  Map<String, dynamic> toJson(SingleTrip data) {
    return {
      _Fields.id: data.id,
      _Fields.routeId: data.routeId,
      _Fields.scheduleTripId: data.scheduleTripId,
      _Fields.routeName: data.routeName,
      _Fields.routeNum: data.routeNum,
      _Fields.carrier: data.carrier,
      _Fields.bus: data.bus,
      _Fields.driver1: data.driver1,
      _Fields.driver2: data.driver2,
      _Fields.frequency: data.frequency,
      _Fields.waybillNum: data.waybillNum,
      _Fields.status: data.status,
      _Fields.statusPrint: data.statusPrint,
      _Fields.statusReason: data.statusReason,
      _Fields.statusComment: data.statusComment,
      _Fields.statusDate: data.statusDate,
      _Fields.departure: data.departure,
      _Fields.departureTime: data.departureTime,
      _Fields.arrivalToDepartureTime: data.arrivalToDepartureTime,
      _Fields.destination: data.destination,
      _Fields.arrivalTime: data.arrivalTime,
      _Fields.distance: data.distance,
      _Fields.duration: data.duration,
      _Fields.transitSeat: data.transitSeat,
      _Fields.freeSeatsAmount: data.freeSeatsAmount,
      _Fields.passengerFareCost: data.passengerFareCost,
      _Fields.fares: data.fares,
      _Fields.platform: data.platform,
      _Fields.onSale: data.onSale,
      _Fields.route: data.route,
      _Fields.additional: data.additional,
      _Fields.saleStatus: data.saleStatus,
      _Fields.acbpdp: data.acbpdp,
      _Fields.currency: data.currency,
      _Fields.carrierData: data.carrierData,
    };
  }

  @override
  SingleTrip fromJson(Map<String, dynamic> json) {
    return SingleTrip(
      id: json[_Fields.id],
      routeId: json[_Fields.routeId],
      scheduleTripId: json[_Fields.scheduleTripId],
      routeName: json[_Fields.routeName],
      routeNum: json[_Fields.routeNum],
      carrier: json[_Fields.carrier],
      bus: json[_Fields.bus],
      driver1: json[_Fields.driver1],
      driver2: json[_Fields.driver2],
      frequency: json[_Fields.frequency],
      waybillNum: json[_Fields.waybillNum],
      status: json[_Fields.status],
      statusPrint: json[_Fields.statusPrint],
      statusReason: json[_Fields.statusReason],
      statusComment: json[_Fields.statusComment],
      statusDate: json[_Fields.statusDate],
      departure: json[_Fields.departure],
      departureTime: json[_Fields.departureTime],
      arrivalToDepartureTime: json[_Fields.arrivalToDepartureTime],
      destination: json[_Fields.destination],
      arrivalTime: json[_Fields.arrivalTime],
      distance: json[_Fields.distance],
      duration: json[_Fields.duration],
      transitSeat: json[_Fields.transitSeat],
      freeSeatsAmount: json[_Fields.freeSeatsAmount],
      passengerFareCost: json[_Fields.passengerFareCost],
      fares: json[_Fields.fares],
      platform: json[_Fields.platform],
      onSale: json[_Fields.onSale],
      route: json[_Fields.route],
      additional: json[_Fields.additional],
      saleStatus: json[_Fields.saleStatus],
      acbpdp: json[_Fields.acbpdp],
      currency: json[_Fields.currency],
      carrierData: json[_Fields.carrierData],
    );
  }
}

abstract final class _Fields {
  static const String id = 'Id';
  static const String routeId = 'RouteId';
  static const String scheduleTripId = 'ScheduleTripId';
  static const String routeName = 'RouteName';
  static const String routeNum = 'RouteNum';
  static const String carrier = 'Carrier';
  static const String bus = 'Bus';
  static const String driver1 = 'Driver1';
  static const String driver2 = 'Driver2';
  static const String frequency = 'Frequency';
  static const String waybillNum = 'WaybillNum';
  static const String status = 'Status';
  static const String statusPrint = 'StatusPrint';
  static const String statusReason = 'StatusReason';
  static const String statusComment = 'StatusComment';
  static const String statusDate = 'StatusDate';
  static const String departure = 'Departure';
  static const String departureTime = 'DepartureTime';
  static const String arrivalToDepartureTime = 'ArrivalToDepartureTime';
  static const String destination = 'Destination';
  static const String arrivalTime = 'ArrivalTime';
  static const String distance = 'Distance';
  static const String duration = 'Duration';
  static const String transitSeat = 'TransitSeat';
  static const String freeSeatsAmount = 'FreeSeatsAmount';
  static const String passengerFareCost = 'PassengerFareCost';
  static const String fares = 'Fares';
  static const String platform = 'Platform';
  static const String onSale = 'OnSale';
  static const String route = 'Route';
  static const String additional = 'Additional';
  static const String saleStatus = 'SaleStatus';
  static const String acbpdp = 'Acbpdp';
  static const String currency = 'Currency';
  static const String carrierData = 'CarrierData';
}
