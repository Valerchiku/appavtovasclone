import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_notifications_repository.dart';
import 'package:timezone/timezone.dart' as tz;

final class NotificationsInteractor {
  final INotificationsRepository _notificationsRepository;

  NotificationsInteractor(this._notificationsRepository);

  Future<void> init() {
    return _notificationsRepository.init();
  }
  
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required tz.TZDateTime dateTime,
  }) {
    return _notificationsRepository.scheduleNotification(
      title: title,
      body: body,
      dateTime: dateTime,
    );
  }
}
