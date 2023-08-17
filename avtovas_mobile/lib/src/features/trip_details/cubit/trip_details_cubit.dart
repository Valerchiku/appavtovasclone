import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  TripDetailsCubit()
      : super(
          const TripDetailsState(
            route: CustomRoute(null, null),
          ),
        );

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.routeByIndex(navigationIndex),
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

  scheduleNotification(
      String title, String body, DateTime dateTime) async {
    Mocks.notificationsRepository.init();
    Mocks.notificationsRepository.scheduleNotification(
        title: title, body: body, dateTime: dateTime);
  }
}
