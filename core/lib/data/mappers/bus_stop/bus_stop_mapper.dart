import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/bus_stop/bus_stop.dart';

final class BusStopMapper implements BaseMapper<BusStop> {
  @override
  Map<String, dynamic> toJson(BusStop data) {
    return {
      _Fields.name: data.name,
      _Fields.code: data.code,
      _Fields.id: data.id,
      _Fields.country: data.country,
      _Fields.region: data.region,
      _Fields.district: data.district,
      _Fields.automated: data.automated,
      _Fields.hasDestinations: data.hasDestinations,
      _Fields.uTC: data.uTC,
      _Fields.gPSCoordinates: data.gPSCoordinates,
      _Fields.address: data.address,
    };
  }

  @override
  BusStop fromJson(Map<String, dynamic> json) {
    return BusStop(
      name: json[_Fields.name],
      code: json[_Fields.code],
      id: json[_Fields.id],
      country: json[_Fields.country],
      region: json[_Fields.region],
      district: json[_Fields.district],
      automated: json[_Fields.automated],
      hasDestinations: json[_Fields.hasDestinations],
      uTC: json[_Fields.uTC],
      gPSCoordinates: json[_Fields.gPSCoordinates] ?? '',
      address: json[_Fields.address],
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String code = 'Code';
  static const String id = 'Id';
  static const String country = 'Country';
  static const String region = 'Region';
  static const String district = 'District';
  static const String automated = 'Automated';
  static const String hasDestinations = 'HasDestinations';
  static const String uTC = 'UTC';
  static const String gPSCoordinates = 'GPSCoordinates';
  static const String address = 'Address';
}
