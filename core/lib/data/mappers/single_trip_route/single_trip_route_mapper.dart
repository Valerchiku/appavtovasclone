import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/bus_stop/bus_stop_mapper.dart';
import 'package:core/domain/entities/single_trip/single_trip_route.dart';

final class SingleTripRouteMapper implements BaseMapper<SingleTripRoute> {
  @override
  Map<String, dynamic> toJson(SingleTripRoute data) {
    return {
      _Fields.busStop: BusStopMapper().toJson(data.busStop),
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
      busStop: BusStopMapper().fromJson(json[_Fields.busStop]),
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
  static const String busStop = 'BusStop';
  static const String distance = 'Distance';
  static const String departureTime = 'DepartureTime';
  static const String arrivalTime = 'ArrivalTime';
  static const String stopDuration = 'StopDuration';
  static const String dayOfTrip = 'DayOfTrip';
  static const String platform = 'Platform';
  static const String banSaleFrom = 'BanSaleFrom';
  static const String banSaleTo = 'BanSaleTo';
}
