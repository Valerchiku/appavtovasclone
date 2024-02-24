import 'dart:convert';

import 'package:core/data/data_sources/interfaces/i_notifications_data_source.dart';
import 'package:core/data/utils/constants/private_info.dart';
import 'package:core/data/utils/notifications/notifications_requests.dart';
import 'package:core/domain/utils/core_logger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

final class NotificationsDataSource implements INotificationsDataSource {
  NotificationsDataSource() {
    _uploadNotifications();
  }

  final _localNotifications = FlutterLocalNotificationsPlugin();

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'Напоминание',
    description: 'This channel is used for important notifications',
    importance: Importance.high,
  );

  final _notificationsInstance = FirebaseMessaging.instance;

  @override
  Future<String?> fetchFcmToken() async {
    await _notificationsInstance.getAPNSToken();

    return _notificationsInstance.getToken();
  }

  @override
  Future<void> removeNotificationByTripUid({required String tripUid}) async {
    try {
      final response = await http.post(
        Uri.parse(PrivateInfo.notificationsEndpoint),
        body: jsonEncode(
          NotificationsRequests.removeNotificationRequest(
            notificationTripUid: tripUid,
          ),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Something went wrong: ${response.body}');
      }

      CoreLogger.infoLog('Notification removed successfully!');
    } catch (e) {
      CoreLogger.errorLog(
        'Notifications updating completed with error',
        params: {'Exception': e},
      );
    }
  }

  @override
  Future<void> updateScheduledNotifications({
    required String userUid,
    required String notificationDateTime,
    required List<String> availableFcmTokens,
    required String notificationTripUid,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(PrivateInfo.notificationsEndpoint),
        body: jsonEncode(
          NotificationsRequests.insertNotificationRequest(
            notificatedUser: userUid,
            notificationDateTime: notificationDateTime,
            availableFcmTokens: availableFcmTokens,
            notificationTripUid: notificationTripUid,
          ),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Something went wrong: ${response.body}');
      }

      CoreLogger.infoLog('Notification sent successfully!');
    } catch (e) {
      CoreLogger.errorLog(
        'Notifications updating completed with error',
        params: {'Exception': e},
      );
    }
  }

  Future<void> _uploadNotifications() async {
    await _notificationsInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await _initNotifications();

    await _notificationsInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _notificationsInstance.getInitialMessage().then(_onNewNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_onNewNotification);
    FirebaseMessaging.onMessage.listen(_onNewNotification);
  }

  Future<void> _onNewNotification(RemoteMessage? message) async {
    print('notification');

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
        iOS: const DarwinNotificationDetails(),
      ),
      payload: jsonEncode(message.toMap()),
    );
  }

  Future<void> _initNotifications() async {
    const androidSettings = AndroidInitializationSettings('avtovas_logo');
    const iOSSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    await _localNotifications.initialize(settings);
  }
}
