import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/features/about/pages/about_page.dart';
import 'package:avtovas_mobile/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_mobile/src/features/avtovas_contacts/pages/avtovas_contacts_page.dart';
import 'package:avtovas_mobile/src/features/bus_station_contacts/pages/bus_station_contacts_page.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/notifications/pages/notifications_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/pages/payments_history_page.dart';
import 'package:avtovas_mobile/src/features/reference_info/pages/reference_info.dart';
import 'package:avtovas_mobile/src/features/return_condition/pages/return_condition_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_of_use_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_contract_offer_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_page.dart';
import 'package:avtovas_mobile/src/features/terms/pages/terms_privacy_policy_page.dart';
import 'package:avtovas_mobile/src/features/ticketing/pages/ticketing_page.dart';
import 'package:avtovas_mobile/src/features/trip_details/pages/trip_details_page.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/pages/trips_schedule_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common/avtovas_navigation.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _initialRoute = Routes.mainPath.route;

  // Here we will pass MainSearchArgs.
  // ignore: unused_field
  static final _initialExtra = UnimplementedError();
  static final _routerNotifier = RouterNotifier();
  static final _i = i;

  static final _appRoutes = <RouteBase>[
    AvtovasRouteBuilder<MainPage>(
      i: _i,
      routeConfig: Routes.mainPath,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TripsSchedulePage, TripsScheduleArguments>(
      i: _i,
      routeConfig: Routes.searchTripsPath,
      getFirstParams: (state) => state.extra! as TripsScheduleArguments,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TripDetailsPage, TripDetailsArguments>(
      i: _i,
      routeConfig: Routes.tripDetailsPath,
      getFirstParams: (state) => state.extra! as TripDetailsArguments,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TicketingPage, TicketingArguments>(
      i: _i,
      routeConfig: Routes.ticketingPath,
      getFirstParams: (state) => state.extra! as TicketingArguments,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PassengersPage>(
      i: _i,
      routeConfig: Routes.passengersPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PaymentsHistoryPage>(
      i: _i,
      routeConfig: Routes.paymentsHistoryPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<NotificationsPage>(
      i: _i,
      routeConfig: Routes.notificationsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<AvtovasContactsPage>(
      i: _i,
      routeConfig: Routes.contactsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<ReferencePageInfoPage>(
      i: _i,
      routeConfig: Routes.helpReferenceInfoPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TermsPage>(
      i: _i,
      routeConfig: Routes.termsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<AboutPage>(
      i: _i,
      routeConfig: Routes.aboutPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<BusStationContactsPage>(
      i: _i,
      routeConfig: Routes.busStationContactsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TermsPrivacyPolicyPage>(
      i: _i,
      routeConfig: Routes.privacyPolicyPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TermsOfUsePage>(
      i: _i,
      routeConfig: Routes.termsOfUsePath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TermsContractOfferPage>(
      i: _i,
      routeConfig: Routes.contractOfferPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<ReturnConditionPage>(
      i: _i,
      routeConfig: Routes.returnConditionsPath,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<AuthorizationPage, AuthorizationPageArguments>(
      i: _i,
      routeConfig: Routes.authPath,
      getFirstParams: (state) => state.extra! as AuthorizationPageArguments,
    ).buildTransparentRoute(),
  ];

  static GoRouter router({
    List<GoRoute>? routes,
    String? initialLocation,
    VoidCallback? onRouteErrorAction,
    PageArguments? initialExtra,
  }) {
    final appRoutes = routes ?? _appRoutes;
    return GoRouter(
      routes: appRoutes,
      initialLocation: initialLocation ?? _initialRoute,
      initialExtra: initialExtra,
      debugLogDiagnostics: true,
      observers: [
        BotToastNavigatorObserver(),
      ],
      errorBuilder: (_, __) {
        return RedirectError(action: onRouteErrorAction);
      },
      refreshListenable: _routerNotifier,
    );
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
