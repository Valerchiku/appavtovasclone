import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';
import 'package:avtovas_web/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_web/src/features/trip-details/pages/trip_details_page.dart';
import 'package:avtovas_web/src/features/trips-schedule/pages/trips_schedule_page.dart';
import 'package:common/avtovas_authorization.dart';

void initPages() {
  i
    ..registerFactory<MainSearchPage>(MainSearchPage.new)
    ..registerFactoryParam<TicketingPage, TicketingArguments, void>(
      (args, _) => TicketingPage(trip: args.trip),
    )
    ..registerFactory<AuthorizationPage>(
      () => const AuthorizationPage(
        content: AuthorizationContent.phone,
      ),
    )
    ..registerFactory<PassengersPage>(
      PassengersPage.new,
    )
    ..registerFactoryParam<TripsSchedulePage, TripsScheduleArguments, void>(
      (args, _) => TripsSchedulePage(
        departurePlace: args.departurePlace,
        arrivalPlace: args.arrivalPlace,
        tripDate: args.tripDate,
      ),
    )
    ..registerFactoryParam<TripDetailsPage, TripDetailsArguments, void>(
      (args, _) => TripDetailsPage(
        tripId: args.routeId,
        departure: args.departure,
        destination: args.destination,
      ),
    );
}
