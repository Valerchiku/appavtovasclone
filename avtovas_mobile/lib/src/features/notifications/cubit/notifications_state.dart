part of 'notifications_cubit.dart';

final class NotificationsState extends Equatable {
  final bool showNotifications;

  @override
  List<Object?> get props => [
        showNotifications,
      ];

  const NotificationsState({
    required this.showNotifications,
  });

  NotificationsState copyWith({required bool showNotifications}) {
    return NotificationsState(
    showNotifications: showNotifications ?? this.showNotifications,
    );
  }
}
