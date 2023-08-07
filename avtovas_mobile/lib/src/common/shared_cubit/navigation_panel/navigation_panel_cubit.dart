import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  NavigationPanelCubit()
      : super(
          const NavigationPanelState(
            navigationIndex: 0,
            isMainPage: true,
          ),
        );

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );
  }
}
