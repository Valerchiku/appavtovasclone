import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_repository.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trip_details_state.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final INotificationsRepository _notificationsRepository;

  TripDetailsCubit(this._notificationsRepository)
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
    _notificationsRepository.init();
    _notificationsRepository.scheduleNotification(
        title: title, body: body, dateTime: dateTime);
  }
}
