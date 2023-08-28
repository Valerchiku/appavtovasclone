import 'package:common/avtovas_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reference_info_state.dart';

class ReferenceInfoCubit extends Cubit<ReferenceInfoState> {
  ReferenceInfoCubit()
      : super(
          const ReferenceInfoState(
            route: CustomRoute(
              null,
              null,
            ),
          ),
        );

  void onWhatTripsAreThereButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void onWillThereBeATripButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void onHowFarInAdvanceDoYouNeedToBuyATicketButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
        ),
      ),
    );
    _resetRoute();
  }

  void onHowToCalculateTravelTimeAndArrivalTimeButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          null,
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
