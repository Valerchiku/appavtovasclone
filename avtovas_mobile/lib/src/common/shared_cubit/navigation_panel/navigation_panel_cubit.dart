import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_authorization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  final IUserRepository _userRepository;

  final _navigationStack = <int>[];

  bool get _isAuth =>
      _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

  NavigationPanelCubit(this._userRepository)
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
            isMainPage: true,
          ),
        );

  GoRouter get _appRouter => AppRouter.appRouter;

  bool onWillPop() {
    if (_navigationStack.isEmpty) return true;

    final lastNavigationIndex = _navigationStack.removeLast();

    if (state.navigationIndex == 0) return true;

    emit(
      state.copyWith(navigationIndex: lastNavigationIndex),
    );

    return false;
  }

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    if (state.navigationIndex == navigationIndex) return;

    _navigationStack.add(state.navigationIndex);

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );

    if (navigationIndex == 1 && !_isAuth) {
      _appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          authConfig(content: AuthorizationContent.phone, fromMyTrips: true),
        ),
      );
    }
  }
}
