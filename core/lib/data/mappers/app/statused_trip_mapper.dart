import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/single_trip/single_trip_mapper.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/utils/user_trip_status.dart';

abstract final class _Fields {
  static const String uuid = 'uuid';
  static const String tripStatus = 'trip_status';
  static const String tripCostStatus = 'trip_cost_status';
  static const String saleDate = 'sale_date';
  static const String saleCost = 'sale_cost';
  static const String places = 'places';
  static const String trip = 'trip';
}

final class StatusedTripMapper implements BaseMapper<StatusedTrip> {
  @override
  Map<String, dynamic> toJson(StatusedTrip data) {
    return {
      _Fields.uuid: data.uuid,
      _Fields.trip: SingleTripMapper().toJson(data.trip),
      _Fields.saleDate: data.saleDate.toString(),
      _Fields.saleCost: data.saleCost,
      _Fields.places: data.places,
      _Fields.tripStatus: data.tripStatus.name,
      _Fields.tripCostStatus: data.tripCostStatus.name,
    };
  }

  @override
  StatusedTrip fromJson(Map<String, dynamic> json) {
    return StatusedTrip(
      uuid: json[_Fields.uuid],
      trip: SingleTripMapper().fromJson(json[_Fields.trip]),
      saleDate: DateTime.parse(json[_Fields.saleDate]),
      saleCost: json[_Fields.saleCost],
      places: (json[_Fields.places] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      tripStatus: UserTripStatusHelper.tripStatusFromString(
        json[_Fields.tripStatus],
      ),
      tripCostStatus: UserTripStatusHelper.tripCostStatusFromString(
        json[_Fields.tripCostStatus],
      ),
    );
  }
}
