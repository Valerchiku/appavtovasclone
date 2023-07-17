import 'package:core/avtovas_core.dart';
import 'package:core/src/domain/utils/entities_typedef.dart';

final class MainSearchInteractor {
  final ITripRepository _tripRepository;

  MainSearchInteractor(this._tripRepository);

  AsyncTrip getTripSegment({required String tripId}) {
    return _tripRepository.getTripSegment(tripId: tripId);
  }

  AsyncTripsList getPopularTrips() {
    return _tripRepository.getPopularTrips();
  }

  AsyncTripsList getTrips({
    String? tripId,
    String? departurePlace,
    String? arrivalPlace,
    String? departureDate,
  }) {
    return _tripRepository.getTrips(
      tripId: tripId,
      departurePlace: departurePlace,
      arrivalPlace: arrivalPlace,
      departureDate: departureDate,
    );
  }
}
