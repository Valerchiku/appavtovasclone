import 'package:core/data/data_sources/interfaces/i_cache_data_source.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';

final class CacheDataSource implements ICacheDataSource {
  /// REGION - Trips schedule.

  String _lastSearchedDeparture = '';
  String _lastSearchedArrival = '';
  DateTime _lastSearchedDate = DateTime.now();

  /// END REGION.

  /// REGION - Trips details.

  String _tripId = '';
  String _tripDepartureName = '';
  String _tripDestinationName = '';

  /// END REGION.

  /// REGION - Ticketing.

  SingleTrip? _singleTrip;

  /// END REGION.

  @override
  (String, String, DateTime) getTripsScheduleArguments() {
    return (
      _lastSearchedDeparture,
      _lastSearchedArrival,
      _lastSearchedDate,
    );
  }

  @override
  void setTripsScheduleArguments({
    required String lastSearchedDeparture,
    required String lastSearchArrival,
    required DateTime lastSearchedDate,
  }) {
    _lastSearchedDeparture = lastSearchedDeparture;
    _lastSearchedArrival = lastSearchArrival;
    _lastSearchedDate = lastSearchedDate;
  }

  @override
  (String, String, String) getTripDetailsArguments() {
    return (_tripId, _tripDepartureName, _tripDestinationName);
  }

  @override
  void setTripDetailsArguments({
    required String tripId,
    required String tripDepartureName,
    required String tripDestinationName,
  }) {
    _tripId = tripId;
    _tripDepartureName = tripDepartureName;
    _tripDestinationName = _tripDestinationName;
  }

  @override
  SingleTrip? getTicketingArguments() {
    // TODO(dev): Add error factory.
    return _singleTrip;
  }

  @override
  void setTicketingArguments({required SingleTrip trip}) {
    _singleTrip = trip;
  }
}
