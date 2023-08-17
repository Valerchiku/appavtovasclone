import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_repository.dart';
import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_service.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationsRepository implements INotificationsRepository {
  final INotificationsService service;

  NotificationsRepository(this.service);

  Future<void> init() async {
    service.init();
  }

  Future<void> scheduleNotification(
      {required String title, required String body, required DateTime dateTime}) {
    return service.scheduleNotification(title, body, dateTime);
  }
}
