import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/alert_statuses.dart';
import 'package:avtovas_mobile/src/features/main/utils/main_alert_types.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  final _navigationStack = <int>[];

  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
            isMainPage: true,
            alertStatus: AlertStatuses.collapsed,
            alertType: ProfileAlertTypes.logout,
          ),
        );

  bool onWillPop() {
    if (_navigationStack.isEmpty) return true;

    var lastNavigationIndex = _navigationStack.removeLast();

    while (_navigationStack.isNotEmpty &&
        state.navigationIndex == lastNavigationIndex) {
      lastNavigationIndex = _navigationStack.removeLast();
    }

    emit(
      state.copyWith(navigationIndex: lastNavigationIndex),
    );

    return false;
  }

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    _navigationStack.add(state.navigationIndex);

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );
  }

  void toggleLogoutAlert() {
    var status = AlertStatuses.collapsed;
    switch (state.alertStatus) {
      case AlertStatuses.collapsed:
        status = AlertStatuses.expanded;
        break;
      case AlertStatuses.expanded:
        status = AlertStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        alertStatus: status,
        alertType: ProfileAlertTypes.logout,
      ),
    );
  }

  void closeBottomSheet() {
    emit(
      state.copyWith(alertStatus: AlertStatuses.collapsed),
    );
  }
}
