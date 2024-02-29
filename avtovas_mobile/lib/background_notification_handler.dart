import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> onNewBackgroundNotification(RemoteMessage message) async {
  final notification = message.notification;

  if (notification == null) return;

  final localNotifications = FlutterLocalNotificationsPlugin();

  localNotifications
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  const initializationSettingsAndroid =
      AndroidInitializationSettings('avtovas_logo');

  final initializationSettingsIOS = DarwinInitializationSettings(
    onDidReceiveLocalNotification: (id, title, body, payload) async {},
  );

  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await localNotifications.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (payload) {
      final message = RemoteMessage.fromMap(
        jsonDecode(payload.payload!),
      );
    },
  );

  const iOSPlatformSpecifics = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  const androidPlatformSpecifics = AndroidNotificationDetails(
    'high_importance_channel',
    'Напоминание',
    channelDescription: 'This channel is used for important notifications',
    priority: Priority.high,
    importance: Importance.max,
  );

  const platformSpecifics = NotificationDetails(
    android: androidPlatformSpecifics,
    iOS: iOSPlatformSpecifics,
  );

  localNotifications.show(
    notification.hashCode,
    notification.title,
    notification.body,
    platformSpecifics,
    payload: jsonEncode(message.toMap()),
  );
}
