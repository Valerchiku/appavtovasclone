abstract interface class INotificationsService {
  Future<void> init();

  Future<void> scheduleNotification(String title, String body, DateTime dateTime);
}
