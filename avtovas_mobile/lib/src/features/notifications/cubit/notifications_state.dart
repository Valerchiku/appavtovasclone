part of 'notifications_cubit.dart';

final class NotificationsState extends Equatable {
  final CustomRoute route;
  final bool showNotifications;
  final String userEmail;

  @override
  List<Object?> get props => [
        route,
        showNotifications,
        userEmail,
      ];

  const NotificationsState({
    required this.route,
    required this.showNotifications,
    required this.userEmail,
  });

  NotificationsState copyWith({
    CustomRoute? route,
    bool? showNotifications,
    String? userEmail,
  }) {
    return NotificationsState(
      route: route ?? this.route,
      showNotifications: showNotifications ?? this.showNotifications,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
