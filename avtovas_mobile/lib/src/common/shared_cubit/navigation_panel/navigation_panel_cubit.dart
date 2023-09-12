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
          ),
        );

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
    _navigationStack.add(state.navigationIndex);

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );
  }
}
