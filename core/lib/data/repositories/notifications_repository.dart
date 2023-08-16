import 'package:core/domain/entities/bus_stop/bus_stop.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:core/domain/interfaces/i_notifications_repository.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class NotificationsRepository implements INotificationsRepository {
  
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final CHANNEL_ID = 0;
  
  NotificationsRepository() {
    init();
  }

  @override
  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final DarwinInitializationSettings initializationSettingsDarwin =
    DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required tz.TZDateTime dateTime,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        CHANNEL_ID, title, body, dateTime, NotificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}
