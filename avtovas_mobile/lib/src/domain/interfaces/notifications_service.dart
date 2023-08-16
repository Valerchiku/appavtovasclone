import 'package:timezone/timezone.dart' as tz;

abstract class NotificationService {
  Future<void> init();

  Future<void> scheduleNotification(String title, String body, tz.TZDateTime dateTime);
}
