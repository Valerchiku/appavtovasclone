import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/utils/mock_notifications.dart';
import 'package:avtovas_mobile/src/domain/interfaces/i_notifications_repository.dart';
import 'package:avtovas_mobile/src/data/repositories/notifications_repository.dart';
import 'package:core/avtovas_core.dart';

void initRepositories() {
  i.registerSingleton<IOneCRepository>(
    OneCRepository(
      i.get(),
    ),
  );
  i.registerSingleton<INotificationsRepository>(
    NotificationsRepository(
      MockNotificationsService(),
    ),
  );
}
