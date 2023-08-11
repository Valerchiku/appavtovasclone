import 'package:common/src/navigation/base_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// ignore_for_file: prefer-match-file-name

// Proxy type to maintain backwards compatibility and extend.
typedef AvtovasRouteBuilder<T extends Widget>
= AvtovasRouteWithParamsBuilder<T, void, void>;

typedef AvtovasRouteWithParamBuilder<T extends Widget, P>
= AvtovasRouteWithParamsBuilder<T, P, void>;

/// Type parameter [P] is the type of the parameter that can be passed
/// in the constructor. Use [RouteBuilder] if no parameter is needed.
class AvtovasRouteWithParamsBuilder<T extends Widget, P, E> {
  @visibleForTesting
  final BaseRoutes routeConfig;
  final GetIt i;
  final GlobalKey<NavigatorState>? parentNavigatorKey;
  final P Function(GoRouterState state)? getFirstParams;
  final E Function(GoRouterState state)? getSecondParams;
  final Page<dynamic> Function(BuildContext context, GoRouterState state)? pageBuilder;
  String? name;

  /// Nested routes.
  final List<GoRoute> routes;

  AvtovasRouteWithParamsBuilder({
    required this.routeConfig,
    required this.i,
    this.parentNavigatorKey,
    this.getFirstParams,
    this.getSecondParams,
    this.routes = const <GoRoute>[],
    this.pageBuilder,
    this.name,
  });

  @visibleForTesting
  T buildWidget({P? withParam, E? additionalParam}) {
    if (withParam != null) {
      if (additionalParam != null) {
        return i.get<T>(param1: withParam, param2: additionalParam);
      }

      return i.get<T>(param1: withParam);
    }

    return i.get<T>();
  }

  GoRoute buildRoute() {
    return GoRoute(
      path: routeConfig.name,
      name: name ?? routeConfig.name,
      parentNavigatorKey: parentNavigatorKey,
      builder: (BuildContext context, GoRouterState state) {
        return buildWidget(
          withParam: getFirstParams?.call(state),
          additionalParam: getSecondParams?.call(state),
        );
      },
      routes: routes,
      pageBuilder: pageBuilder,
    );
  }

  GoRoute buildTransparentRoute() {
    return GoRoute(
      path: routeConfig.name,
      name: name ?? routeConfig.name,
      pageBuilder: (BuildContext context, GoRouterState state) {
        final child = buildWidget(
          withParam: getFirstParams?.call(state),
          additionalParam: getSecondParams?.call(state),
        );
        // return NoTransitionPage(child: child);
        // May be we'll want to add transition animation
        // for page swapping in the future.

        return CustomTransitionPage<MaterialPage<Object>>(
          child: child,
          opaque: false,
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
              ) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            final tween = Tween(
              begin: begin,
              end: end,
            )
                .chain(
              CurveTween(
                curve: curve,
              ),
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      },
      routes: routes,
    );
  }
}
