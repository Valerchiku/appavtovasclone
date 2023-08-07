import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit()
      : super(
          const NotificationsState(
            showNotifications: false,
          ),
        );

  void toggleNotifications({required bool value}) {
    emit(
      state.copyWith(showNotifications: value),
    );
  }
}
