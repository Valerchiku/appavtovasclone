import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/search-trips'),
  tripDetailsPath('/trip-details'),
  ticketingPath('/ticketing'),
  passengersPath('/profile/passengers'),
  paymentsHistoryPath('/profile/payments-history'),
  notificationsPath('/profile/notifications'),
  referenceInformationPath('/profile/reference-information'),
  contactsPath('/contacts'),
  helpPage('/help-page'),
  helpReferenceInfoPath('/reference'),
  termsPath('/profile/terms'),
  aboutPath('/profile/about'),
  busStationContactsPath('/support/bus-station-contacts'),
  privacyPolicyPath('/terms/privacy-policy'),
  termsOfUsePath('/terms/terms-of-use'),
  contractOfferPath('/terms/contract-offer'),
  returnConditionsPath('/return-conditions'),
  authPath('/auth');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
