import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:common/avtovas_navigation.dart';

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

PageConfiguration referenceInfoConfig() {
  return PageConfiguration(path: Routes.helpReferenceInfoPath.name);
}

PageConfiguration termsConfig() {
  return PageConfiguration(path: Routes.termsPath.name);
}

PageConfiguration aboutConfig() {
  return PageConfiguration(path: Routes.aboutPath.name);
}