import 'package:core/domain/entities/single_trip/single_trip.dart';

abstract interface class ICacheDataSource {
  void setTripsScheduleArguments({
    required String lastSearchedDeparture,
    required String lastSearchArrival,
    required DateTime lastSearchedDate,
  });

  (String, String, DateTime) getTripsScheduleArguments();

  void setTripDetailsArguments({
    required String tripId,
    required String tripDepartureName,
    required String tripDestinationName,
  });

  (String, String, String) getTripDetailsArguments();

  void setTicketingArguments({required SingleTrip trip});

  SingleTrip? getTicketingArguments();
}
