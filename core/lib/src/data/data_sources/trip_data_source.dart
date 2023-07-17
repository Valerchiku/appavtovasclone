import 'package:core/src/data/data_sources/interfaces/i_trip_data_source.dart';
import 'package:core/src/domain/utils/entities_typedef.dart';

final class TripDataSource implements ITripDataSource {
  @override
  AsyncTrip getTripSegment({required String tripId}) {
    throw UnimplementedError();
  }

  @override
  AsyncTripsList getPopularTrips() {
    throw UnimplementedError();
  }

  @override
  AsyncTripsList getTrips({
    String? tripId,
    String? departurePlace,
    String? arrivalPlace,
    String? departureDate,
  }) {
    assert(
      tripId == null &&
          departurePlace == null &&
          arrivalPlace == null &&
          departureDate == null,
      'Trips could not be found because all arguments are null',
    );

    throw UnimplementedError();
  }
}
