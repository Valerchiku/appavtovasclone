import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/bottom_sheet_statuses.dart';
import 'package:avtovas_mobile/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_mobile/src/features/main/utils/alert_types.dart';
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
            alertStatus: BottomSheetStatuses.collapsed,
            alertType: null,
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

  void toggleSendCallWithCodeDialog() {
    var status = BottomSheetStatuses.collapsed;
    switch (state.alertStatus) {
      case BottomSheetStatuses.collapsed:
        status = BottomSheetStatuses.expanded;
        break;
      case BottomSheetStatuses.expanded:
        status = BottomSheetStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        alertStatus: status,
        alertType: MainAlertTypes.sendCallWithCode,
      ),
    );
  }

  void toggleDeleteUpcomingTripDialog() {
    var status = BottomSheetStatuses.collapsed;
    switch (state.alertStatus) {
      case BottomSheetStatuses.collapsed:
        status = BottomSheetStatuses.expanded;
        break;
      case BottomSheetStatuses.expanded:
        status = BottomSheetStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        alertStatus: status,
        alertType: MainAlertTypes.deleteUpcomingTrip,
      ),
    );
  }

  void toggleDeleteArchiveTripDialog() {
    var status = BottomSheetStatuses.collapsed;
    switch (state.alertStatus) {
      case BottomSheetStatuses.collapsed:
        status = BottomSheetStatuses.expanded;
        break;
      case BottomSheetStatuses.expanded:
        status = BottomSheetStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        alertStatus: status,
        alertType: MainAlertTypes.deleteArchiveTrip,
      ),
    );
  }

  void closeBottomSheet() {
    emit(
      state.copyWith(alertStatus: BottomSheetStatuses.collapsed),
    );
  }
}
