import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/repositories/notifications_repository.dart';

void initRepositories() {
  i.registerSingleton<IOneCRepository>(
    OneCRepository(
      i.get(),
    ),
  );
  i.registerSingleton<INotificationsRepository>(
    NotificationsRepository(),
  );
}
