import 'package:avtovas_mobile/src/features/main/utils/dialog_statuses.dart';
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
            dialogStatus: DialogStatuses.collapsed,
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

  void toggleDialog() {
    print('asd');
    var status = DialogStatuses.collapsed;
    switch (state.dialogStatus) {
      case DialogStatuses.collapsed:
        status = DialogStatuses.expanded;
        break;
      case DialogStatuses.expanded:
        status = DialogStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        dialogStatus: status,
      ),
    );
  }
}
