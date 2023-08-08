import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/features/contacts/pages/contacts_page.dart';
import 'package:avtovas_mobile/src/features/main/pages/main_page.dart';
import 'package:avtovas_mobile/src/features/notifications/pages/notifications_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_mobile/src/features/payments-history/pages/payments_history_page.dart';
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
    AvtovasRouteBuilder<TripsSchedulePage>(
      i: _i,
      routeConfig: Routes.searchTripsPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<TripDetailsPage>(
      i: _i,
      routeConfig: Routes.tripDetailsPath,
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
    AvtovasRouteBuilder<ContactsPage>(
      i: _i,
      routeConfig: Routes.contactsPath,
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
