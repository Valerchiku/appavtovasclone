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

  // ignore: avoid_positional_boolean_parameters
  void toggleNotifications(bool val) {
    emit(
      state.copyWith(val: val),
    );
  }
}
