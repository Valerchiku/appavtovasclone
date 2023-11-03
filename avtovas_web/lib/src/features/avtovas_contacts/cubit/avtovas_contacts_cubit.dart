import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'avtovas_contacts_state.dart';

class AvtovasContactsCubit extends Cubit<AvtovasContactsState> {
  AvtovasContactsCubit()
      : super(
          const AvtovasContactsState(
            route: CustomRoute(null, null),
          ),
        );

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        // route: RouteHelper.clearedRoute(navigationIndex),
        route: CustomRoute(null, null),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }
}
