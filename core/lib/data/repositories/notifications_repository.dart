import 'package:core/data/data_sources/interfaces/i_notifications_data_source.dart';
import 'package:core/domain/interfaces/i_notifications_repository.dart';

final class NotificationsRepository implements INotificationsRepository {
  final INotificationsDataSource _notificationsDataSource;

  const NotificationsRepository(this._notificationsDataSource);

  @override
  Future<void> removeNotificationByTripUid({required String tripUid}) {
    return _notificationsDataSource.removeNotificationByTripUid(
      tripUid: tripUid,
    );
  }

  @override
  Future<void> updateScheduledNotifications({
    required String userUid,
    required String notificationDateTime,
    required List<String> availableFcmTokens,
    required String notificationTripUid,
  }) {
    return _notificationsDataSource.updateScheduledNotifications(
      userUid: userUid,
      notificationDateTime: notificationDateTime,
      availableFcmTokens: availableFcmTokens,
      notificationTripUid: notificationTripUid,
    );
  }

  @override
  Future<String?> fetchFcmToken() => _notificationsDataSource.fetchFcmToken();
}
