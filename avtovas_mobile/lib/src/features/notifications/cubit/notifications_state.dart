part of 'notifications_cubit.dart';

final class NotificationsState extends Equatable {
  final CustomRoute route;
  final bool showNotifications;

  @override
  List<Object?> get props => [
        route,
        showNotifications,
      ];

  const NotificationsState({
    required this.route,
    required this.showNotifications,
  });

  NotificationsState copyWith({
    CustomRoute? route,
    bool? showNotifications,
  }) {
    return NotificationsState(
      route: route ?? this.route,
      showNotifications: showNotifications ?? this.showNotifications,
    );
  }
}
