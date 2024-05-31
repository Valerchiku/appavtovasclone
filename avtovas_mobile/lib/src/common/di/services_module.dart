import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_services.dart';

void initServices() {
  i.registerSingleton<CrashlyticsService>(CrashlyticsService());
}
