import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';

final class BusStopMapper implements BaseMapper<BusStop> {
  @override
  Map<String, dynamic> toJson(BusStop data) {
    return {
      _Fields.name: data.name,
      _Fields.code: data.code,
    };
  }

  @override
  BusStop fromJson(Map<String, dynamic> json) {
    return BusStop(
      name: json[_Fields.name],
      code: json[_Fields.code],
      id: id,
      country: country,
      automated: automated,
      hasDestinations: hasDestinations,
      uTC: uTC,
      gPSCoordinates: gPSCoordinates,
    );
  }
}

abstract final class _Fields {
  static const String name = 'name';
  static const String code = 'code';
  // etc.
}
