import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';

void initDataSources() {
  i.registerSingleton<IOneCDataSource>(
    OneCDataSource(),
  );
}
