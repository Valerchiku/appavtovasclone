import 'package:common/avtovas_navigation.dart';

enum Routes implements BaseRoutes {
  mainSearchPath('/main-search'),
  myTripsPath('/my-trips'),
  searchPath('/search'),
  supportPath('/support'),
  profilePath('/profile'),
  tripDetailsPath('/tripDetails');

  final String route;

  const Routes(this.route);

  @override
  String get name => route;
}
