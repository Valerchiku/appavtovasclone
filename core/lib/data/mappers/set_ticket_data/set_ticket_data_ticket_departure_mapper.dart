import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/set_ticket_data/set_ticket_data_ticket_departure.dart';

abstract final class _Fields {
  static const String locationType = 'LocationType';
  static const String locality = 'Locality';
  static const String stoppingPlace = 'StoppingPlace';
  static const String phone = 'Phone';
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

final class SetTicketDataTicketDepartureMapper implements BaseMapper<SetTicketDataTicketDeparture> {
  @override
  Map<String, dynamic> toJson(SetTicketDataTicketDeparture data) {
    return {
      _Fields.locationType: data.locationType,
      _Fields.locality: data.locality,
      _Fields.stoppingPlace: data.stoppingPlace,
      _Fields.phone: data.phone,
      _Fields.name: 'Name',
      _Fields.code: 'Code',
      _Fields.id: 'Id',
      _Fields.country: 'Country',
      _Fields.automated: 'Automated',
      _Fields.hasDestinations: 'HasDestinations',
      _Fields.uTC: 'UTC',
      _Fields.gPSCoordinates: 'GPSCoordinates',
      _Fields.address: 'Address',
      _Fields.region: 'Region',
      _Fields.district: 'District',
    };
  }

  @override
  SetTicketDataTicketDeparture fromJson(Map<String, dynamic> json) {
    return SetTicketDataTicketDeparture(
      locationType: json[_Fields.locationType],
      locality: json[_Fields.locality],
      stoppingPlace: json[_Fields.stoppingPlace],
      phone: json[_Fields.phone],
      region: json[_Fields.region],
      district: json[_Fields.district],
      address: json[_Fields.address],
      name: json[_Fields.name],
      code: json[_Fields.code],
      id: json[_Fields.id],
      country: json[_Fields.country],
      automated: json[_Fields.automated],
      hasDestinations: json[_Fields.hasDestinations],
      uTC: json[_Fields.uTC],
      gPSCoordinates: json[_Fields.gPSCoordinates],
    );
  }
}
