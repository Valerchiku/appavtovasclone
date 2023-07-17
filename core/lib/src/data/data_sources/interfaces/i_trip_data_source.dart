import 'package:core/src/domain/utils/entities_typedef.dart';

abstract interface class ITripDataSource {
  AsyncTrip getTripSegment({required String tripId});

  AsyncTripsList getPopularTrips();

  AsyncTripsList getTrips({
    String? tripId,
    String? departurePlace,
    String? arrivalPlace,
    String? departureDate,
  });
}
