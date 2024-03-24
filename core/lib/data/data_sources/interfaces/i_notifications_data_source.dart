abstract interface class INotificationsDataSource {
  Future<String?> fetchFcmToken();

  Future<void> updateScheduledNotifications({
    required String userUid,
    required String notificationDateTime,
    required List<String> availableFcmTokens,
    required String notificationTripUid,
  });

  Future<void> removeNotificationByTripUid({required String tripUid});
}
