import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/pages/avtovas_contacts_page.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/notifications/pages/notifications_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/pages/payments_history_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';

void initPages() {
  i
    ..registerFactory<MainPage>(MainPage.new)
    ..registerFactory<TripsSchedulePage>(TripsSchedulePage.new)
    ..registerFactoryParam<TripDetailsPage, TripDetailsArguments, void>(
      (args, _) => TripDetailsPage(trip: args.trip),
    )
    ..registerFactory<PassengersPage>(PassengersPage.new)
    ..registerFactory<PaymentsHistoryPage>(PaymentsHistoryPage.new)
    ..registerFactory<NotificationsPage>(NotificationsPage.new)
    ..registerFactory<AvtovasContactsPage>(AvtovasContactsPage.new);
}
