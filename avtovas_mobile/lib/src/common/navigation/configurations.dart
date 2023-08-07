import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:common/avtovas_navigation.dart';

PageConfiguration mainSearchConfig() {
  return PageConfiguration(path: Routes.mainPath.name);
}

PageConfiguration searchTripsConfig() {
  return PageConfiguration(path: Routes.searchTripsPath.name);
}

PageConfiguration tripDetailsConfig() {
  return PageConfiguration(path: Routes.tripDetailsPath.name);
}

PageConfiguration myTripsConfig() {
  return PageConfiguration(path: Routes.myTripsPath.name);
}

PageConfiguration supportConfig() {
  return PageConfiguration(path: Routes.supportPath.name);
}

PageConfiguration profileConfig() {
  return PageConfiguration(path: Routes.profilePath.name);
}
