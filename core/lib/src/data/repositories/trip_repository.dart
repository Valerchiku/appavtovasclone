import 'package:core/src/data/data_sources/interfaces/i_trip_data_source.dart';
import 'package:core/src/domain/interfaces/i_trips_repository.dart';
import 'package:core/src/domain/utils/entities_typedef.dart';

final class TripRepository implements ITripRepository {
  TripRepository(this._tripDataSource);

  final ITripDataSource _tripDataSource;

  @override
  AsyncTrip getTripSegment({required String tripId}) {
    return _tripDataSource.getTripSegment(tripId: tripId);
  }

  @override
  AsyncTripsList getPopularTrips() {
    return _tripDataSource.getPopularTrips();
  }

  @override
  AsyncTripsList getTrips({
    String? tripId,
    String? departurePlace,
    String? arrivalPlace,
    String? departureDate,
  }) {
    return _tripDataSource.getTrips(
      tripId: tripId,
      departurePlace: departurePlace,
      arrivalPlace: arrivalPlace,
      departureDate: departureDate,
    );
  }
}
