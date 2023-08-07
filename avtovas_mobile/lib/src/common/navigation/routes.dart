import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/search-trips'),
  tripDetailsPath('/trip-details'),
  passengersPath('/profile/passengers'),
  paymentsHistoryPath('/profile/payments-history'),
  notificationsPath('/profile/notifications'),
  referenceInformationPath('/profile/reference-information');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
