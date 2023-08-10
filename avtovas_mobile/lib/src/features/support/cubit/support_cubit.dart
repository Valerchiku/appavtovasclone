import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit()
      : super(
    const SupportState(
      route: CustomRoute(null, null),
    ),
  );

  void onCallButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          contactsConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onReferenceInfoButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          referenceInfoConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onContactsButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          busStationContactsConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

}
