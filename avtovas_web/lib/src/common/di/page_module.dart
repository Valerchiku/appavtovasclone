import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/pages/avtovas_contacts_page.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/pages/bus_station_contacts_page.dart';
import 'package:avtovas_web/src/features/contract_offer_page/pages/contract_offer_page.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';
import 'package:avtovas_web/src/features/my_trips/pages/my_trips_page.dart';
import 'package:avtovas_web/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_web/src/features/payment/pages/payment_page.dart';
import 'package:avtovas_web/src/features/payments-history/pages/payments_history_page.dart';
import 'package:avtovas_web/src/features/privacy_policy_page/pages/privacy_policy_page.dart';
import 'package:avtovas_web/src/features/reference_info/pages/reference_info_page.dart';
import 'package:avtovas_web/src/features/return_condition/pages/return_condition_page.dart';
import 'package:avtovas_web/src/features/terms_of_use_page/pages/terms_of_use_page.dart';
import 'package:avtovas_web/src/features/terms_page/pages/terms_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_web/src/features/trip-details/pages/trip_details_page.dart';
import 'package:avtovas_web/src/features/trips-schedule/pages/trips_schedule_page.dart';
import 'package:common/avtovas_authorization.dart';

void initPages() {
  i
    ..registerFactory<MainSearchPage>(MainSearchPage.new)
    ..registerFactoryParam<TicketingPage, TicketingArguments, void>(
      (args, _) => TicketingPage(
        trip: args.trip,
        tripId: args.tripId,
        departure: args.departure,
        destination: args.destination,
        dbName: args.dbName,
      ),
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
        tripDate: args.tripDate.toString(),
        extraWasEmpty: args.extraWasEmpty,
      ),
    )
    ..registerFactoryParam<TripDetailsPage, TripDetailsArguments, void>(
      (args, _) => TripDetailsPage(
        tripId: args.routeId,
        departure: args.departure,
        destination: args.destination,
        dbName: args.dbName,
      ),
    )
    ..registerFactory<AvtovasContactsPage>(AvtovasContactsPage.new)
    ..registerFactory<ReferenceInfoPage>(ReferenceInfoPage.new)
    ..registerFactory<BusStationContactsPage>(BusStationContactsPage.new)
    ..registerFactory<PrivacyPolicyPage>(PrivacyPolicyPage.new)
    ..registerFactory<ContractOfferPage>(ContractOfferPage.new)
    ..registerFactory<TermsOfUsePage>(TermsOfUsePage.new)
    ..registerFactory<TermsPage>(TermsPage.new)
    ..registerFactory<PaymentsHistoryPage>(PaymentsHistoryPage.new)
    ..registerFactory<ReturnConditionPage>(ReturnConditionPage.new)
    ..registerFactoryParam<MyTripsPage, MyTripsArguments, void>(
      (args, _) => MyTripsPage(
        statusedTripId: args.statusedTripId,
        paymentId: args.paymentId,
      ),
    )
    ..registerFactoryParam<PaymentPage, PaymentArguments, void>(
      (args, _) => PaymentPage(
        confirmationToken: args.confirmationToken,
        encodedPaymentParams: args.encodedPaymentParams,
      ),
    );
}
