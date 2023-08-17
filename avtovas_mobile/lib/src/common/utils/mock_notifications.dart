import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MockNotificationsService implements INotificationsService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final CHANNEL_ID = 0;
  final NOTIFICATION_DURATION = const Duration(hours: 1);
  String LOCATION_NAME = 'Europe/Moscow';
  late final tz.Location location;

  @override
  Future<void> scheduleNotification(
      String title, String body, DateTime dateTime) async {
    final tzDateTime =
        tz.TZDateTime.from(dateTime, location).subtract(NOTIFICATION_DURATION);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        CHANNEL_ID, title, body, tzDateTime, NotificationDetails(),
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
    tz.initializeTimeZones();
    final location = tz.getLocation(LOCATION_NAME);
    tz.setLocalLocation(location);
  }
}
