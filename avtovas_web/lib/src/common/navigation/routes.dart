import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/founded-trips'),
  tripDetailsPath('/trip-details'),
  ticketingPath('/ticketing'),
  passengersPath('/passengers'),
  paymentsHistoryPath('/payments-history'),
  referenceInformationPath('/reference-information'),
  contactsPath('/contacts'),
  helpPage('/help-page'),
  avtovasContactsPath('/avtovas-contacts'),
  helpReferenceInfoPath('/reference'),
  termsPath('/terms'),
  aboutPath('/about'),
  busStationContactsPath('/support/bus-station-contacts'),
  privacyPolicyPath('/terms/privacy-policy'),
  consentProcessingPath('/terms/consent-processing'),
  contractOfferPath('/terms/contract-offer'),
  authPath('/authenticate');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
