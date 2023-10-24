import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';

void initRepositories() {
  i
    ..registerSingleton<IOneCRepository>(
      OneCRepository(
        i.get(),
      ),
    )
    ..registerSingleton<ILocalAuthorizationRepository>(
      LocalAuthorizationRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IUserRepository>(
      UserRepository(
        i.get(),
      ),
    )
    ..registerSingleton<ICallerRepository>(
      CallerRepository(
        i.get(),
      ),
    );
}
