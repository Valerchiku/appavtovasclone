import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_service.dart';

abstract interface class INotificationsRepository {
  final INotificationsService service;

  INotificationsRepository(this.service);

  Future<void> init();

  Future<void> scheduleNotification(
      {required String title, required String body, required DateTime dateTime});
}
