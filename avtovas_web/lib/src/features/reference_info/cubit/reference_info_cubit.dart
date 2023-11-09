import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reference_info_state.dart';

class ReferenceInfoCubit extends Cubit<ReferenceInfoState> {
  ReferenceInfoCubit()
      : super(
          const ReferenceInfoState(
            route: CustomRoute(null, null),
          ),
        );

  void onBackButtonTap() {
    emit(
      state.copyWith(
        route: const CustomRoute.pop(),
      ),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        // route: RouteHelper.clearedRoute(navigationIndex),
        // ignore: avoid_redundant_argument_values
        route: null,
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
