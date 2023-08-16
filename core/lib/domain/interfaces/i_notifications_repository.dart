import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:timezone/timezone.dart' as tz;

abstract interface class INotificationsRepository {
  Future<void> init();

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required tz.TZDateTime dateTime,
  });
}
