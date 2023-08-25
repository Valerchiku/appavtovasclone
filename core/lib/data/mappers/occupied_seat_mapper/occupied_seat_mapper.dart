import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/seats_scheme_mapper.dart';
import 'package:core/domain/entities/occupied_seat/occupied_seat.dart';
import 'package:core/domain/entities/oneC_entities/seats_scheme.dart';

final class OccupiedSeatMapper implements BaseMapper<OccupiedSeat> {
  @override
  Map<String, dynamic> toJson(OccupiedSeat data) {
    return {
      _Fields.id: data.id,
      _Fields.model: data.model,
      _Fields.licencePlate: data.licencePlate,
      _Fields.name: data.name,
      _Fields.seatsClass: data.seatsClass,
      _Fields.seatCapacity: data.seatsCapacity,
      _Fields.standCapacity: data.standCapacity,
      _Fields.baggageCapacity: data.baggageCapacity,
      _Fields.seatsScheme: data.seatsScheme,
      _Fields.garageNum: data.garageNum,
    };
  }

  @override
  OccupiedSeat fromJson(Map<String, dynamic> json) {
    final jsonSeatsScheme = json[_Fields.seatsScheme];

    final seatsScheme = <SeatsScheme>[];

    if (jsonSeatsScheme is Map<String, dynamic>) {
      seatsScheme.add(
        SeatsSchemeMapper().fromJson(jsonSeatsScheme),
      );
    } else if (jsonSeatsScheme is List<dynamic>) {
      seatsScheme.addAll(
        jsonSeatsScheme.map(
          (el) => SeatsSchemeMapper().fromJson(
            el as Map<String, dynamic>,
          ),
        ),
      );
    }
    return OccupiedSeat(
      id: json[_Fields.id] ?? '',
      model: json[_Fields.model] ?? '',
      licencePlate: json[_Fields.licencePlate] ?? '',
      name: json[_Fields.name] ?? '',
      seatsClass: json[_Fields.seatsClass] ?? '',
      seatsCapacity: json[_Fields.seatCapacity] ?? '',
      standCapacity: json[_Fields.standCapacity] ?? '',
      baggageCapacity: json[_Fields.baggageCapacity] ?? '',
      seatsScheme: seatsScheme,
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
