import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/oneC_entities/departure.dart';

final class TripDepartureMapper implements BaseMapper<TripDeparture> {
  @override
  Map<String, dynamic> toJson(TripDeparture data) {
    return {
      _Fields.name: data.name,
      _Fields.code: data.code,
      _Fields.id: data.id,
      _Fields.country: data.country,
      _Fields.automated: data.automated,
      _Fields.hasDestinations: data.hasDestinations,
      _Fields.uTC: data.uTC,
      _Fields.gPSCoordinates: data.gPSCoordinates,
      _Fields.address: data.address,
      _Fields.region: data.region,
      _Fields.district: data.district,
    };
  }

  @override
  TripDeparture fromJson(Map<String, dynamic> json) {
    return TripDeparture(
      name: json[_Fields.name],
      code: json[_Fields.code],
      id: json[_Fields.id],
      country: json[_Fields.country],
      automated: json[_Fields.automated],
      hasDestinations: json[_Fields.hasDestinations],
      uTC: json[_Fields.uTC],
      gPSCoordinates: json[_Fields.gPSCoordinates],
      address: json[_Fields.address],
      region: json[_Fields.region],
      district: json[_Fields.district],
    );
  }
}

abstract final class _Fields {
  static const String name = 'Name';
  static const String code = 'Code';
  static const String id = 'Id';
  static const String country = 'Country';
  static const String automated = 'Automated';
  static const String hasDestinations = 'HasDestinations';
  static const String uTC = 'UTC';
  static const String gPSCoordinates = 'GPSCoordinates';
  static const String address = 'Address';
  static const String region = 'Region';
  static const String district = 'District';
}
