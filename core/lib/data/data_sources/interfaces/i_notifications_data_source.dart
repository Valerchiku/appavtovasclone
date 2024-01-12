abstract interface class INotificationsDataSource {
  Future<void> sendScheduledNotification({
    required DateTime notificationDate,
    required String notificationTitle,
    required String notificationMessage,
  });
}
