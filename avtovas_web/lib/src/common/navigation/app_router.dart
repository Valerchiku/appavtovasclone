import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/navigation/routes.dart';
import 'package:avtovas_web/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';
import 'package:avtovas_web/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:common/avtovas_navigation.dart';

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

  static final _appRoutes = <RouteBase>[
    AvtovasRouteBuilder<MainSearchPage>(
      i: _i,
      routeConfig: Routes.mainPath,
    ).buildTransparentRoute(),
    AvtovasRouteWithParamBuilder<TicketingPage, TicketingArguments>(
      i: _i,
      routeConfig: Routes.ticketingPath,
      getFirstParams: (state) => state.extra! as TicketingArguments,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<AuthorizationPage>(
      i: _i,
      routeConfig: Routes.authPath,
    ).buildTransparentRoute(),
    AvtovasRouteBuilder<PassengersPage>(
      i: _i,
      routeConfig: Routes.passengersPath,
    ).buildTransparentRoute(),
  ];

  static GoRouter router({
    List<GoRoute>? routes,
    String? initialLocation,
    VoidCallback? onRouteErrorAction,
    PageArguments? initialExtra,
  }) {
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
