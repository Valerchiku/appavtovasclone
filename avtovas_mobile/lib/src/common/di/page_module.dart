import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/contacts/pages/contacts_page.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/notifications/pages/notifications_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/pages/payments_history_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_page.dart';
import 'package:avtovas_mobile/src/features/about/pages/about_page.dart';

void initPages() {
  i
    ..registerFactory<MainPage>(MainPage.new)
    ..registerFactory<TripsSchedulePage>(TripsSchedulePage.new)
    ..registerFactory<TripDetailsPage>(TripDetailsPage.new)
    ..registerFactory<PassengersPage>(PassengersPage.new)
    ..registerFactory<PaymentsHistoryPage>(PaymentsHistoryPage.new)
    ..registerFactory<NotificationsPage>(NotificationsPage.new)
    ..registerFactory<ContactsPage>(ContactsPage.new)
    ..registerFactory<TermsPage>(TermsPage.new)
    ..registerFactory<AboutPage>(AboutPage.new);
}
