import 'package:core/domain/entities/domain_object.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/utils/user_trip_status.dart';

final class StatusedTrip extends DomainObject {
  final Trip trip;
  final UserTripStatus tripStatus;

  @override
  List<Object?> get props => [
        trip,
        tripStatus,
      ];

  const StatusedTrip({
    required this.tripStatus,
    required this.trip,
  });

  @override
  StatusedTrip copyWith({Trip? trip, UserTripStatus? tripStatus}) {
    return StatusedTrip(
      tripStatus: tripStatus ?? this.tripStatus,
      trip: trip ?? this.trip,
    );
  }
}
