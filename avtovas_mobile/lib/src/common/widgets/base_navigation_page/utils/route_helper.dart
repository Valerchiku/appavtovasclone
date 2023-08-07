import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_navigation.dart';

// ignore_for_file: no-magic-number

abstract final class RouteHelper {
  static CustomRoute routeByIndex(int navigationIndex) =>
      switch (navigationIndex) {
        0 => CustomRoute(
            RouteType.navigateTo,
            mainSearchConfig(),
            shouldReplace: true,
          ),
        1 => CustomRoute(
            RouteType.navigateTo,
            myTripsConfig(),
            shouldReplace: true,
          ),
        2 => CustomRoute(
            RouteType.navigateTo,
            supportConfig(),
            shouldReplace: true,
          ),
        3 => CustomRoute(
            RouteType.navigateTo,
            profileConfig(),
            shouldReplace: true,
          ),
        _ => throw Exception(
            'Page with index ($navigationIndex) does not exist',
          ),
      };
}
