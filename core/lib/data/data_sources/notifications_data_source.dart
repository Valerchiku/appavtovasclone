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

  final _notificationsInstance = FirebaseMessaging.instance;

  @override
  Future<String?> fetchFcmToken() async {
    final apns = await _notificationsInstance.getAPNSToken();
    final fcm = await _notificationsInstance.getToken();

    return fcm;
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

    _notificationsInstance.getInitialMessage().then(_onNewNotification);

    FirebaseMessaging.onMessageOpenedApp.listen(_onNewNotification);
    FirebaseMessaging.onMessage.listen(_onNewNotification);
  }

  Future<void> _onNewNotification(RemoteMessage? message) async {
    print(message?.contentAvailable);

    final notification = message?.data;

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
      notification['title'].toString(),
      notification['body'].toString(),
      platformSpecifics,
      payload: jsonEncode(message?.toMap()),
    );
  }
}
