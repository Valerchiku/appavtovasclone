import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/search-trips'),
  tripDetailsPath('/trip-details'),
  passengersPath('/profile/passengers'),
  paymentsHistoryPath('/profile/payments-history'),
  notificationsPath('/profile/notifications'),
  referenceInformationPath('/profile/reference-information'),
  contactsPath('/contacts'),
  helpReferenceInfoPath('/reference'),
  termsPath('/profile/terms'),
  aboutPath('/profile/about'),
  busStationContactsPath('/support/bus-station-contacts'),
  privacyPolicyPath('/terms/privacy-policy'),
  consentProcessingPath('/terms/consent-processing'),
  contractOfferPath('/terms/contract-offer');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
