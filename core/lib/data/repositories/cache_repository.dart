import 'package:core/avtovas_core.dart';
import 'package:core/domain/interfaces/i_cache_repository.dart';

final class CacheRepository implements ICacheRepository {
  final ICacheDataSource _cacheDataSource;

  CacheRepository(this._cacheDataSource);

  @override
  (String, String, DateTime) getTripsScheduleArguments() {
    return _cacheDataSource.getTripsScheduleArguments();
  }

  @override
  void setTripsScheduleArguments({
    required String lastSearchedDeparture,
    required String lastSearchArrival,
    required DateTime lastSearchedDate,
  }) {
    _cacheDataSource.setTripsScheduleArguments(
      lastSearchedDeparture: lastSearchedDeparture,
      lastSearchArrival: lastSearchArrival,
      lastSearchedDate: lastSearchedDate,
    );
  }

  @override
  (String, String, String) getTripDetailsArguments() {
    return _cacheDataSource.getTripDetailsArguments();
  }

  @override
  void setTripDetailsArguments({
    required String tripId,
    required String tripDepartureName,
    required String tripDestinationName,
  }) {
    _cacheDataSource.setTripDetailsArguments(
      tripId: tripId,
      tripDepartureName: tripDepartureName,
      tripDestinationName: tripDestinationName,
    );
  }
}
