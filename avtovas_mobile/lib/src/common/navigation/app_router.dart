import 'dart:io';

import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final _initialRoute = Routes.mainSearchPath.route;

  // Here we will pass MainSearchArgs.
  static final _initialExtra = throw UnimplementedError();
  static final _routerNotifier = RouterNotifier();

  static final _appRoutes = throw UnimplementedError();

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
      initialExtra: initialExtra ?? _initialExtra,
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
