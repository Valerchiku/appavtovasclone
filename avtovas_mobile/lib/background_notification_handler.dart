import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> onNewBackgroundNotification(RemoteMessage message) async {
  final notification = message.notification;

  if (notification == null) return;

  final localNotifications = FlutterLocalNotificationsPlugin();

  const androidChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.max,
  );

  await localNotifications
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);

  const androidSettings = AndroidInitializationSettings('avtovas_logo');
  const iOSSettings = DarwinInitializationSettings();

  const settings = InitializationSettings(
    android: androidSettings,
    iOS: iOSSettings,
  );

  await localNotifications.initialize(
    settings,
    onDidReceiveNotificationResponse: (payload) {
      final message = RemoteMessage.fromMap(
        jsonDecode(payload.payload!),
      );
    },
  );

  localNotifications.show(
    notification.hashCode,
    notification.title,
    notification.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        androidChannel.id,
        androidChannel.name,
        channelDescription: androidChannel.description,
        icon: 'assets/images/avtovas_logo_green.png',
      ),
    ),
    payload: jsonEncode(message.toMap()),
  );
}