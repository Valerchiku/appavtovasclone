import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainPath('/'),
  searchTripsPath('/search-trips'),
  tripDetailsPath('/trip-details'),
  myTripsPath('/my-trips'),
  supportPath('/support-path'),
  profilePath('/profile');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
