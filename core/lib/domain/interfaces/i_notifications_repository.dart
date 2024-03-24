abstract interface class INotificationsRepository {
  Future<void> removeNotificationByTripUid({required String tripUid});

  Future<void> updateScheduledNotifications({
    required String userUid,
    required String notificationDateTime,
    required List<String> availableFcmTokens,
    required String notificationTripUid,
  });

  Future<String?> fetchFcmToken();
}
