import 'package:core/data/mappers/base_mapper.dart';
import 'package:core/data/mappers/trip/trip_mapper.dart';
import 'package:core/domain/entities/app_entities/statused_trip.dart';
import 'package:core/domain/utils/user_trip_status.dart';

abstract final class _Fields {
  static const String tripStatus = 'tripStatus';
  static const String trip = 'trip';
}

final class StatusedTripMapper implements BaseMapper<StatusedTrip> {
  @override
  Map<String, dynamic> toJson(StatusedTrip data) {
    return {
      _Fields.tripStatus: data.tripStatus.name,
      _Fields.trip: TripMapper().toJson(data.trip),
    };
  }

  @override
  StatusedTrip fromJson(Map<String, dynamic> json) {
    return StatusedTrip(
      tripStatus: UserTripStatusHelper.statusFromString(
        json[_Fields.tripStatus],
      ),
      trip: TripMapper().fromJson(json[_Fields.trip]),
    );
  }
}
