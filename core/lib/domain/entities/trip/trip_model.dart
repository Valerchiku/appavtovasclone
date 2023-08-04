import 'package:equatable/equatable.dart';

final class TripModel extends Equatable {
  final String? id;
  final String? routeId;
  final String? scheduleTripId;
  final String? routeName;
  final String? routeNum;
  final String? carrier;
  final Bus? bus;
  final String? driver1;
  final String? driver2;
  final String? frequency;
  final String? waybillNum;
  final String? status;
  final String? statusPrint;
  final String? statusReason;
  final String? statusDate;
  final Departure? departure;
  final String? departureTime;
  final String? arrivalToDepartureTime;
  final Destination? destination;
  final String? arrivalTime;
  final String? distance;
  final String? duration;
  final String? transitSeats;
  final String? freeSeatsAmount;
  final String? passengerFareCost;
  final String? platform;
  final String? onSale;
  final String? additional;
  final String? currency;
  final CarrierData? carrierData;
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

  const TripModel({
    this.id,
    this.routeId,
    this.scheduleTripId,
    this.routeName,
    this.routeNum,
    this.carrier,
    this.bus,
    this.driver1,
    this.driver2,
    this.frequency,
    this.waybillNum,
    this.status,
    this.statusPrint,
    this.statusReason,
    this.statusDate,
    this.departure,
    this.departureTime,
    this.arrivalToDepartureTime,
    this.destination,
    this.arrivalTime,
    this.distance,
    this.duration,
    this.transitSeats,
    this.freeSeatsAmount,
    this.passengerFareCost,
    this.platform,
    this.onSale,
    this.additional,
    this.currency,
    this.carrierData,
    this.checkMan,
  });
}

final class Bus extends Equatable {
  final String? id;
  final String? model;
  final String? licencePlate;
  final String? name;
  final String? seatsClass;
  final String? seatCapacity;
  final String? standCapacity;
  final String? baggageCapacity;
  final String? garageNum;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        id,
        model,
        licencePlate,
        name,
        seatsClass,
        seatCapacity,
        standCapacity,
        baggageCapacity,
        garageNum,
      ];

  const Bus({
    this.id,
    this.model,
    this.licencePlate,
    this.name,
    this.seatsClass,
    this.seatCapacity,
    this.standCapacity,
    this.baggageCapacity,
    this.garageNum,
  });
}

final class Departure extends Equatable {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final String? district;
  final String? automated;
  final String? hasDestinations;
  final String? uTC;
  final String? gPSCoordinates;
  final String? address;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        code,
        id,
        country,
        region,
        district,
        automated,
        hasDestinations,
        uTC,
        gPSCoordinates,
        address,
      ];

  const Departure({
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.uTC,
    this.gPSCoordinates,
    this.address,
  });
}

final class Destination extends Equatable {
  final String? name;
  final String? code;
  final String? id;
  final String? country;
  final String? region;
  final String? district;
  final String? automated;
  final String? hasDestinations;
  final String? uTC;
  final String? gPSCoordinates;
  final String? address;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        code,
        id,
        country,
        region,
        district,
        automated,
        hasDestinations,
        uTC,
        gPSCoordinates,
        address,
      ];

  const Destination({
    this.name,
    this.code,
    this.id,
    this.country,
    this.region,
    this.district,
    this.automated,
    this.hasDestinations,
    this.uTC,
    this.gPSCoordinates,
    this.address,
  });
}

class CarrierData extends Equatable {
  final String? carrierName;
  final String? carrierTaxId;
  final String? carrierStateRegNum;
  final List<CarrierPersonalData>? carrierPersonalData;
  final String? carrierAddress;
  final String? carrierWorkingHours;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        carrierName,
        carrierTaxId,
        carrierStateRegNum,
        carrierPersonalData,
        carrierAddress,
        carrierWorkingHours,
      ];

  const CarrierData({
    this.carrierName,
    this.carrierTaxId,
    this.carrierStateRegNum,
    this.carrierPersonalData,
    this.carrierAddress,
    this.carrierWorkingHours,
  });
}

class CarrierPersonalData extends Equatable {
  final String? name;
  final String? caption;
  final String? mandatory;
  final String? personIdentifier;
  final String? type;
  final String? inputMask;
  final String? value;
  final String? valueKind;
  final DefaultValueVariant? defaultValueVariant;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        caption,
        mandatory,
        personIdentifier,
        type,
        inputMask,
        value,
        valueKind,
        defaultValueVariant,
      ];

  const CarrierPersonalData({
    this.name,
    this.caption,
    this.mandatory,
    this.personIdentifier,
    this.type,
    this.inputMask,
    this.value,
    this.valueKind,
    this.defaultValueVariant,
  });

  static fromJson(data) {}
}

class DefaultValueVariant extends Equatable {
  final String? name;
  final String? inputMask;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        name,
        inputMask,
      ];

  const DefaultValueVariant({
    this.name,
    this.inputMask,
  });
}
