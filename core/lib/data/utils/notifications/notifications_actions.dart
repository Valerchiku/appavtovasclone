enum NotificationsActions {
  insertNewNotification('insertNewNotification'),
  removeNotificationByTripUid('removeNotificationByTripUid');

  final String notificationsAction;

  const NotificationsActions(this.notificationsAction);
}
