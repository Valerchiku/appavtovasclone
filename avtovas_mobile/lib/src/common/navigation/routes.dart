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
  authPath('/auth');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
