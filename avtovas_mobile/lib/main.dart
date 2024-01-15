import 'dart:convert';

import 'package:avtovas_mobile/firebase_options.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/app/pages/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_onNewBackgroundNotification);

  injectDependencies();

  runApp(const App());
}

@pragma('vm:entry-point')
Future<void> _onNewBackgroundNotification(RemoteMessage message) async {
  final notification = message.notification;

  if (notification == null) return;

  final localNotifications = FlutterLocalNotificationsPlugin();

  const androidChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );

  const androidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
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
    },
  );
}
