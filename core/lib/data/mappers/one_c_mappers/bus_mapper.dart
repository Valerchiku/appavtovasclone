import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/one_c_mappers/seats_scheme_mapper.dart';
import 'package:core/domain/entities/one_c_entities/bus.dart';

final class BusMapper implements BaseMapper<Bus> {
  @override
  Map<String, dynamic> toJson(Bus data) {
    return {
      _Fields.id: data.id,
      _Fields.model: data.model,
      _Fields.licencePlate: data.licencePlate,
      _Fields.name: data.name,
      _Fields.seatsClass: data.seatsClass,
      _Fields.seatCapacity: data.seatCapacity,
      _Fields.standCapacity: data.standCapacity,
      _Fields.baggageCapacity: data.baggageCapacity,
      _Fields.seatsScheme: data.seatsScheme
          ?.map((seat) => SeatsSchemeMapper().toJson(seat))
          .toList(),
      _Fields.garageNum: data.garageNum,
    };
  }

  @override
  Bus fromJson(Map<String, dynamic> json) {
    final jsonSeatsScheme = json[_Fields.seatsScheme];

    return Bus(
      id: json[_Fields.id],
      model: json[_Fields.model] ?? '',
      licencePlate: json[_Fields.licencePlate] ?? '',
      name: json[_Fields.name],
      seatsClass: json[_Fields.seatsClass] ?? '',
      seatCapacity: json[_Fields.seatCapacity] ?? '',
      standCapacity: json[_Fields.standCapacity] ?? '',
      baggageCapacity: json[_Fields.baggageCapacity] ?? '',
      seatsScheme: jsonSeatsScheme is List<dynamic>
          ? jsonSeatsScheme.map((e) => SeatsSchemeMapper().fromJson(e)).toList()
          : [SeatsSchemeMapper().fromJson(jsonSeatsScheme)],
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
  static const String seatsScheme = 'SeatsScheme';
  static const String garageNum = 'GarageNum';
}
