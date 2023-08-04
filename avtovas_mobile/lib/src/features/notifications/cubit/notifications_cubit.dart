import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit()
      : super(
          const NotificationsState(
            val: false,
          ),
        );

  void toggleNotifications({required bool? val}) {
    emit(
      state.copyWith(val: val),
    );
  }
}
