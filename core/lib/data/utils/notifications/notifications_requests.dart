import 'package:core/avtovas_core.dart';
import 'package:core/data/utils/notifications/notifications_actions.dart';

abstract final class NotificationsRequests {
  static Map<String, dynamic> insertNotificationRequest({
    required String notificatedUser,
    required String notificationDateTime,
    required List<String> availableFcmTokens,
    required String notificationTripUid,
  }) {
    return {
      'action': NotificationsActions.insertNewNotification.notificationsAction,
      'params': {
        'notificationUniqueId': generateUuid(),
        'uuid': notificatedUser,
        'notificationDateTime': notificationDateTime,
        'availableFcmTokens': availableFcmTokens,
        'notificationTripUid': notificationTripUid,
      },
    };
  }

  static Map<String, dynamic> removeNotificationRequest({
    required String notificationTripUid,
  }) {
    return {
      'action':
          NotificationsActions.removeNotificationByTripUid.notificationsAction,
      'params': {'notificationTripUid': notificationTripUid},
    };
  }
}
