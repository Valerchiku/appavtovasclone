import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';

void initConnectivity() {
  i
    .registerSingleton<IIamYandexToken>(
      IamYandexToken(
        
      ),
    );
    /*..registerSingleton<ILockBoxConnection>(
      LockBoxConnection(
        i.get(),
      ),
    );*/
    /*..registerSingleton<IPostgresConnection>(
      PostgresConnection(),
    );*/
}
