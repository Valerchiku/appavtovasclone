import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/founded-trips'),
  myTripsPath('/my-trips'),
  tripDetailsPath('/trip-details'),
  ticketingPath('/ticketing'),
  passengersPath('/passengers'),
  paymentsHistoryPath('/payments-history'),
  referenceInformationPath('/reference-information'),
  contactsPath('/contacts'),
  helpPage('/help-page'),
  avtovasContactsPath('/avtovas-contacts'),
  helpReferenceInfoPath('/reference'),
  busStationContactsPath('/bus-station-contacts'),
  privacyPolicyPath('/privacy-policy'),
  consentProcessingPath('/consent-processing'),
  termsOfUsePath('/terms-of-use'),
  authPath('/authenticate'),
  paymentPath('/payment');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
