import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:common/avtovas_navigation.dart';

// ignore_for_file: no-magic-number

abstract final class RouteHelper {
  static final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  static CustomRoute clearedIndexedRoute(int navigationIndex) {
    _navigationPanelCubit.updateNavigationIndex(navigationIndex);

    return CustomRoute(
      RouteType.navigateTo,
      mainConfig(),
      shouldClearStack: true,
    );
  }

  // TODO(dev): Remove navigationIndex param.
  static CustomRoute clearedRoute(int navigationIndex) {
    return CustomRoute(
      RouteType.navigateTo,
      mainConfig(),
      shouldClearStack: true,
    );
  }
}
