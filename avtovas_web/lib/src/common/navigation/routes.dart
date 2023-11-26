import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/search-trips'),
  tripDetailsPath('/trip-details'),
  ticketingPath('/ticketing'),
  passengersPath('/profile/passengers'),
  paymentsHistoryPath('/payments-history'),
  notificationsPath('/profile/notifications'),
  referenceInformationPath('/profile/reference-information'),
  helpPage('/help-page'),
  avtovasContactsPath('/avtovas-contacts'),
  helpReferenceInfoPath('/reference'),
  busStationContactsPath('/bus-station-contacts'),
  contactsPath('/contacts'),
  privacyPolicyPath('/privacy-policy'),
  consentProcessingPath('/consent-processing'),
  termsOfUsePath('/terms-of-use'),
  authPath('/auth');


  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
