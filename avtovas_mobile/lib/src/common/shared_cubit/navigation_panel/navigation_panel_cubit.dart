import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_panel_state.dart';

class NavigationPanelCubit extends Cubit<NavigationPanelState> {
  NavigationPanelCubit()
      : super(
          const NavigationPanelState(navigationIndex: 0),
        );


  void updateNavigationIndex(int navigationIndex) {
    emit(
      state.copyWith(navigationIndex: navigationIndex),
    );
  }
}
