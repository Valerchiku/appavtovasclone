import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/about/pages/about_page.dart';
import 'package:avtovas_mobile/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/pages/avtovas_contacts_page.dart';
import 'package:avtovas_mobile/src/features/bus_station_contacts/pages/bus_station_contacts_page.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trips_body.dart';
import 'package:avtovas_mobile/src/features/notifications/pages/notifications_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/pages/payments_history_page.dart';
import 'package:avtovas_mobile/src/features/reference_info/pages/reference_info.dart';
import 'package:avtovas_mobile/src/features/return_conditions_page/pages/return_conditions_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_consent_processing_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_contract_offer_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_privacy_policy_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';

void initPages() {
  i
    ..registerFactory<MainPage>(MainPage.new)
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
    )
    ..registerFactoryParam<TicketingPage, TicketingArguments, void>(
      (args, _) => TicketingPage(
        trip: args.trip,
      ),
    )
    ..registerFactory<PassengersPage>(PassengersPage.new)
    ..registerFactory<PaymentsHistoryPage>(PaymentsHistoryPage.new)
    ..registerFactory<NotificationsPage>(NotificationsPage.new)
    ..registerFactory<ReferencePageInfoPage>(
      ReferencePageInfoPage.new,
    )
    ..registerFactory<TermsPage>(
      TermsPage.new,
    )
    ..registerFactory<TermsPrivacyPolicyPage>(
      TermsPrivacyPolicyPage.new,
    )
    ..registerFactory<TermsConsentProcessingPage>(
      TermsConsentProcessingPage.new,
    )
    ..registerFactory<TermsContractOfferPage>(
      TermsContractOfferPage.new,
    )
    ..registerFactory<AboutPage>(
      AboutPage.new,
    )
    ..registerFactory<BusStationContactsPage>(
      BusStationContactsPage.new,
    )
    ..registerFactory<MyTripsBody>(
      MyTripsBody.new,
    )
    ..registerFactory<ReturnConditionsPage>(
      ReturnConditionsPage.new,
    )
    ..registerFactory<AvtovasContactsPage>(AvtovasContactsPage.new)
    ..registerFactoryParam<AuthorizationPage, AuthorizationPageArguments, void>(
      (args, _) => AuthorizationPage(
        content: args.content,
        phoneNumber: args.phoneNumber,
      ),
    );
}
