import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';

PageConfiguration mainConfig() {
  return PageConfiguration(path: Routes.mainPath.name);
}

PageConfiguration tripsScheduleConfig() {
  return PageConfiguration(path: Routes.searchTripsPath.name);
}

PageConfiguration tripDetailsConfig() {
  return PageConfiguration(path: Routes.tripDetailsPath.name);
}

PageConfiguration passengersConfig() {
  return PageConfiguration(path: Routes.passengersPath.name);
}

PageConfiguration paymentsHistoryConfig() {
  return PageConfiguration(path: Routes.paymentsHistoryPath.name);
}

PageConfiguration notificationsConfig() {
  return PageConfiguration(path: Routes.notificationsPath.name);
}

// Other profile configs

PageConfiguration contactsConfig() {
  return PageConfiguration(path: Routes.contactsPath.name);
}
