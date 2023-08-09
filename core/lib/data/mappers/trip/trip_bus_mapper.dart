import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/trip/trip_bus.dart';

final class TripBusMapper implements BaseMapper<TripBus> {
  @override
  Map<String, dynamic> toJson(TripBus data) {
    return {
      _Fields.id : data.id,
      _Fields.model : data.model,
      _Fields.licencePlate : data.licencePlate,
      _Fields.name : data.name,
      _Fields.seatsClass : data.seatsClass,
      _Fields.seatCapacity : data.seatCapacity,
      _Fields.standCapacity : data.standCapacity,
      _Fields.baggageCapacity : data.baggageCapacity,
      _Fields.garageNum : data.garageNum
    };
  }

  @override
  TripBus fromJson(Map<String, dynamic> json) {
    return TripBus(
      id: json[_Fields.id],
      model: json[_Fields.model],
      licencePlate: json[_Fields.licencePlate],
      name: json[_Fields.name],
      seatsClass: json[_Fields.seatsClass],
      seatCapacity: json[_Fields.seatCapacity],
      standCapacity: json[_Fields.standCapacity],
      baggageCapacity: json[_Fields.baggageCapacity],
      garageNum: json[_Fields.garageNum] ?? '',
    );
  }
}

abstract final class _Fields {
  static const String id = 'Id';
  static const String model = 'Model';
  static const String licencePlate = 'LicencePlate';
  static const String name = 'Name';
  static const String seatsClass = 'SeatsClass';
  static const String seatCapacity = 'SeatCapacity';
  static const String standCapacity = 'StandCapacity';
  static const String baggageCapacity = 'BaggageCapacity';
  static const String garageNum = 'GarageNum';
}
