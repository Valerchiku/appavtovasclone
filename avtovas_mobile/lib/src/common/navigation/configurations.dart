import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';

PageConfiguration mainConfig() {
  return PageConfiguration(path: Routes.mainPath.name);
}

PageConfiguration tripsScheduleConfig({
  required String departurePlace,
  required String arrivalPlace,
  required DateTime tripDate,
}) {
  return PageConfiguration(
    path: Routes.searchTripsPath.name,
    args: TripsScheduleArguments(
      departurePlace: departurePlace,
      arrivalPlace: arrivalPlace,
      tripDate: tripDate,
    ),
  );
}

PageConfiguration tripDetailsConfig({
  required String routeId,
  required String departure,
  required String destination,
}) {
  return PageConfiguration(
    path: Routes.tripDetailsPath.name,
    args: TripDetailsArguments(
      routeId: routeId,
      departure: departure,
      destination: destination,
    ),
  );
}

PageConfiguration ticketingConfig({
  required SingleTrip trip,
}) {
  return PageConfiguration(
    path: Routes.ticketingPath.name,
    args: TicketingArguments(
      trip: trip,
    ),
  );
}

PageConfiguration passengersConfig() {
  return PageConfiguration(path: Routes.passengersPath.name);
}

PageConfiguration paymentsHistoryConfig() {
  return PageConfiguration(path: Routes.paymentsHistoryPath.name);
}

PageConfiguration notificationsConfig() {
  return PageConfiguration(path: Routes.notificationsPath.name);
}

// Other profile configs

PageConfiguration contactsConfig() {
  return PageConfiguration(path: Routes.contactsPath.name);
}

PageConfiguration referenceInfoConfig() {
  return PageConfiguration(path: Routes.helpReferenceInfoPath.name);
}

PageConfiguration termsConfig() {
  return PageConfiguration(path: Routes.termsPath.name);
}

PageConfiguration aboutConfig() {
  return PageConfiguration(path: Routes.aboutPath.name);
}

PageConfiguration busStationContactsConfig() {
  return PageConfiguration(path: Routes.busStationContactsPath.name);
}

PageConfiguration privacyPolicyConfig() {
  return PageConfiguration(path: Routes.privacyPolicyPath.name);
}

PageConfiguration consentProcessingConfig() {
  return PageConfiguration(path: Routes.consentProcessingPath.name);
}

PageConfiguration contractOfferConfig() {
  return PageConfiguration(path: Routes.contractOfferPath.name);
}

PageConfiguration authConfig({
  required AuthorizationContent content,
  String? phoneNumber,
}) {
  return PageConfiguration(
    path: Routes.authPath.name,
    args: AuthorizationPageArguments(
      content: content,
      phoneNumber: phoneNumber,
    ),
  );
}
