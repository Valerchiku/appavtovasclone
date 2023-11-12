import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';

class NotificationHelper {
  static Future<void> showNotification({
    required File file,
    required String title,
    required String body,
  }) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Request notification permission
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();

    // Check and request notification permission (for Android).
    const androidPlatformSpecifics = AndroidNotificationDetails(
      'channel_id',
      'Adun Accounts',
      channelDescription: 'Adun Accounts Notifications',
      priority: Priority.high,
      importance: Importance.max,
    );

    // Initialize platform-specific settings for iOS.
    const iOSPlatformSpecifics = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const platformSpecifics = NotificationDetails(
      android: androidPlatformSpecifics,
      iOS: iOSPlatformSpecifics,
    );

    // Initialize the notification plugin.
    const initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const initializationSettingsIOS = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          // Action to take when the notification is tapped (e.g., open a file).
          OpenFile.open(file.path);
        }
      },
    );

    // Display the notification.
    await flutterLocalNotificationsPlugin.show(
      0, // Unique notification ID.
      title,
      body,
      platformSpecifics,
    );
  }
}
