import 'package:avtovas_mobile/src/domain/interfaces/notifications_service.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationRepository {
  final NotificationService service;

  NotificationRepository(this.service);

  Future<void> init() async {
    service.init();
  }

  Future<void> scheduleNotification(String title, String body, tz.TZDateTime dateTime) {
    return service.scheduleNotification(title, body, dateTime);
  }
}
