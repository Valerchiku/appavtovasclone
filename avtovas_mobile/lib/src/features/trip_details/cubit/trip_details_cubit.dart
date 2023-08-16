import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/interactors/notifications_intercator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timezone/timezone.dart' as tz;

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final NotificationsInteractor _notificationsInteractor;

  TripDetailsCubit(this._notificationsInteractor)
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

  void scheduleNotification(
      String title, String body, tz.TZDateTime dateTime) async {
    _notificationsInteractor.scheduleNotification(
        title: title, body: body, dateTime: dateTime);
  }
}
