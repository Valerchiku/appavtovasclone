import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
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
import 'package:avtovas_web/src/features/return_conditions_page/pages/return_conditions_page.dart';
import 'package:avtovas_web/src/features/terms_of_use_page/pages/terms_of_use_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_web/src/features/trip-details/pages/trip_details_page.dart';
import 'package:avtovas_web/src/features/trips-schedule/pages/trips_schedule_page.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRouter {
  static final _initialRoute = Routes.mainPath.route;

  static late GoRouter appRouter;

  // Here we will pass MainSearchArgs.
  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static ICacheRepository get _cache => _i.get<ICacheRepository>();

  static final _appRoutes = <RouteBase>[
    AvtovasRouteBuilder<MainSearchPage>(
      i: _i,
      routeConfig: Routes.mainPath,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TicketingPage, TicketingArguments>(
      i: _i,
      routeConfig: Routes.ticketingPath,
      getFirstParams: (state) =>
          state.extra as TicketingArguments? ??
          TicketingArguments(
            trip: _cache.getTicketingArguments(),
          ),
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<MyTripsPage, MyTripsArguments>(
      i: _i,
      routeConfig: Routes.myTripsPath,
      getFirstParams: (state) =>
          state.extra as MyTripsArguments? ??
          MyTripsArguments(statusedTripId: '', paymentId: ''),
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<AvtovasContactsPage>(
      i: _i,
      routeConfig: Routes.avtovasContactsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<ReferenceInfoPage>(
      i: _i,
      routeConfig: Routes.helpReferenceInfoPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PrivacyPolicyPage>(
      i: _i,
      routeConfig: Routes.privacyPolicyPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<ContractOfferPage>(
      i: _i,
      routeConfig: Routes.contractOfferPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TermsOfUsePage>(
      i: _i,
      routeConfig: Routes.termsOfUsePath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<AuthorizationPage>(
      i: _i,
      routeConfig: Routes.authPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PassengersPage>(
      i: _i,
      routeConfig: Routes.passengersPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PaymentsHistoryPage>(
      i: _i,
      routeConfig: Routes.paymentsHistoryPath,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TripsSchedulePage, TripsScheduleArguments>(
      i: _i,
      routeConfig: Routes.searchTripsPath,
      getFirstParams: (state) =>
          state.extra as TripsScheduleArguments? ??
          TripsScheduleArguments(
            departurePlace: _cache.getTripsScheduleArguments().$1,
            arrivalPlace: _cache.getTripsScheduleArguments().$2,
            tripDate: _cache.getTripsScheduleArguments().$3,
          ),
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TripDetailsPage, TripDetailsArguments>(
      i: _i,
      routeConfig: Routes.tripDetailsPath,
      getFirstParams: (state) =>
          state.extra as TripDetailsArguments? ??
          TripDetailsArguments(
            routeId: _cache.getTripDetailsArguments().$1,
            departure: _cache.getTripDetailsArguments().$2,
            destination: _cache.getTripDetailsArguments().$3,
          ),
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<PaymentPage, PaymentArguments>(
      i: _i,
      routeConfig: Routes.paymentPath,
      getFirstParams: (state) =>
          state.extra as PaymentArguments? ??
          PaymentArguments(
            confirmationToken: '',
            encodedPaymentParams: '',
          ),
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<ReturnConditionsPage>(
      i: _i,
      routeConfig: Routes.returnConditionsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<BusStationContactsPage>(
      i: _i,
      routeConfig: Routes.busStationContactsPath,
    ).buildTransparentRoute(),
  ];

  static GoRouter router({
    List<GoRoute>? routes,
    String? initialLocation,
    VoidCallback? onRouteErrorAction,
    PageArguments? initialExtra,
  }) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    final appRoutes = routes ?? _appRoutes;
    final router = GoRouter(
      routes: appRoutes,
      initialLocation: initialLocation ?? _initialRoute,
      initialExtra: initialExtra,
      debugLogDiagnostics: true,
      /*observers: [
        BotToastNavigatorObserver(),
      ],*/
      errorBuilder: (_, __) {
        return RedirectError(action: onRouteErrorAction);
      },
      refreshListenable: _routerNotifier,
    );
    appRouter = router;
    return router;
  }
}

@visibleForTesting
class RedirectError extends StatefulWidget {
  final VoidCallback? action;

  const RedirectError({this.action, super.key});

  @override
  State<RedirectError> createState() => _RedirectErrorState();
}

class _RedirectErrorState extends State<RedirectError> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(
      Duration.zero,
      widget.action ??
          () {
            context.push(AppRouter._initialRoute);
          },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
