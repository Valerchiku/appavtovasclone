import 'package:avtovas_mobile/src/common/utils/notifications.dart';

class MockNotificationManager implements NotificationManager {
  const MockNotificationManager();

  @override
  void scheduleNotification(String title, String body) {
    print('Notification: $title, $body');
  }
}
