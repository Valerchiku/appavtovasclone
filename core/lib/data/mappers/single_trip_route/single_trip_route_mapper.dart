import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_route.dart';
import 'package:core/domain/entities/oneC_entities/bus.dart';

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
      bus: _Fields.bus,
      distance: _Fields.distance,
      departureTime: _Fields.departureTime,
      arrivalTime: _Fields.arrivalTime,
      stopDuration: _Fields.stopDuration,
      dayOfTrip: _Fields.dayOfTrip,
      platform: _Fields.platform,
      banSaleFrom: _Fields.banSaleFrom,
      banSaleTo: _Fields.banSaleTo,
    );
  }
}

abstract final class _Fields {
  static const String bus = 'Bus';
  static const String distance = 'Distance';
  static const String departureTime = 'DepartureTime';
  static const String arrivalTime = 'ArrivalTime';
  static const String stopDuration = 'StopDuration';
  static const String dayOfTrip = 'DayOfTrip';
  static const String platform = 'Platform';
  static const String banSaleFrom = 'BanSaleFrom';
  static const String banSaleTo = 'BanSaleTo';
}
