import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_notifications_data_source.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final class NotificationsDataSource implements INotificationsDataSource {
  NotificationsDataSource() {
    _uploadNotifications();
  }

  final _notificationsInstance = FirebaseMessaging.instance;

  final _localNotifications = FlutterLocalNotificationsPlugin();

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );

  var _fcmToken = '';

  @override
  Future<void> sendScheduledNotification({
    required DateTime notificationDate,
    required String notificationTitle,
    required String notificationMessage,
  }) async {}

  Future<void> _uploadNotifications() async {
    await _notificationsInstance.requestPermission();

    await _notificationsInstance.setAutoInitEnabled(true);

    _initNotifications();

    _fcmToken = await _notificationsInstance.getToken() ?? '';

    await _notificationsInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _notificationsInstance.getInitialMessage().then(_onNewNotification);

    FirebaseMessaging.onBackgroundMessage(_onNewBackgroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_onNewNotification);
    FirebaseMessaging.onMessage.listen(_onNewNotification);
  }

  Future<void> _onNewNotification(RemoteMessage? message) async {
    if (message == null) return;

    final notification = message.notification;

    if (notification == null) return;

    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          _androidChannel.id,
          _androidChannel.name,
          channelDescription: _androidChannel.description,
        ),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  Future<void> _initNotifications() async {
    const androidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    const iOSSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) {
        final message = RemoteMessage.fromMap(
          jsonDecode(payload.payload!),
        );

        _onNewNotification(message);
      },
    );
  }
}

Future<void> _onNewBackgroundNotification(RemoteMessage message) async {
  final notification = message.notification;

  if (notification == null) return;
}
