import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/interactors/notifications_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationInteractor _notificationsInteractor;

  NotificationsCubit(this._notificationsInteractor)
      : super(
          const NotificationsState(
            route: CustomRoute(null, null),
            showNotifications: false,
          ),
        ) {
    _initPage();
  }

  void _initPage() {
    final notificationsStatus = _notificationsInteractor.user.showNotifications;

    emit(
      state.copyWith(showNotifications: notificationsStatus),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.popIndexedRoute(navigationIndex),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  Future<void> updateNotificationsStatus({required bool notificationsStatus}) {
    emit(
      state.copyWith(showNotifications: notificationsStatus),
    );

    return _notificationsInteractor.updateNotificationsStatus(
      notificationsStatus: notificationsStatus,
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
