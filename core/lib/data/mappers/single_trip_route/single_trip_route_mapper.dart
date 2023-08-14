import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/oneC_mappers/bus_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_route.dart';

final class SingleTripRouteMapper implements BaseMapper<SingleTripRoute> {
  @override
  Map<String, dynamic> toJson(SingleTripRoute data) {
    return {
      _Fields.bus: BusMapper().toJson(data.bus),
      _Fields.distance: data.distance,
      _Fields.departureTime: data.departureTime,
      _Fields.arrivalTime: data.arrivalTime,
      _Fields.stopDuration: data.stopDuration,
      _Fields.dayOfTrip: data.dayOfTrip,
      _Fields.platform: data.platform,
      _Fields.banSaleFrom: data.banSaleFrom,
      _Fields.banSaleTo: data.banSaleTo,
    };
  }

  @override
  SingleTripRoute fromJson(Map<String, dynamic> json) {
    return SingleTripRoute(
      bus: BusMapper().fromJson(json[_Fields.bus]),
      distance: json[_Fields.distance],
      departureTime: json[_Fields.departureTime],
      arrivalTime: json[_Fields.arrivalTime],
      stopDuration: json[_Fields.stopDuration],
      dayOfTrip: json[_Fields.dayOfTrip],
      platform: json[_Fields.platform],
      banSaleFrom: json[_Fields.banSaleFrom],
      banSaleTo: json[_Fields.banSaleTo],
    );
  }
}

abstract final class _Fields {
  static const String bus = 'bus';
  static const String distance = 'distance';
  static const String departureTime = 'departureTime';
  static const String arrivalTime = 'arrivalTime';
  static const String stopDuration = 'stopDuration';
  static const String dayOfTrip = 'dayOfTrip';
  static const String platform = 'platform';
  static const String banSaleFrom = 'banSaleFrom';
  static const String banSaleTo = 'banSaleTo';
}
