import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';

void initRepositories() {
  i
    ..registerSingleton<IOneCRepository>(
      OneCRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IAuthorizationRepository>(
      AuthorizationRepository(
        i.get(),
      ),
    );
}
