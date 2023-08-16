import 'package:avtovas_mobile/src/common/utils/notifications.dart';
import 'package:avtovas_mobile/src/domain/interfaces/notifications_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class MockNotificationManager implements NotificationManager {
  const MockNotificationManager();

  @override
  void scheduleNotification(String title, String body, tz.TZDateTime dateTime) {
    print('Notification: $title, $body');
  }
}

class MockNotificationService implements NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final CHANNEL_ID = 0;

  @override
  Future<void> scheduleNotification(
      String title, String body, tz.TZDateTime dateTime) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        CHANNEL_ID, title, body, dateTime, NotificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
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
}
