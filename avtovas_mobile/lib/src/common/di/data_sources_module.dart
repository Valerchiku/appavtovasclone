import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initDataSources(FlutterSecureStorage securedStorage) {
  i
    ..registerSingleton<IOneCDataSource>(
      OneCDataSource(),
    )
    ..registerSingleton<ISecuredStorageDataSource>(
      SecuredStorageDataSource(securedStorage),
    )
    ..registerSingleton<IPostgresConfigDataSource>(
      PostgresConfigDataSource(
        i.get(),
      ),
    )
    ..registerSingleton<IPaymentDataSource>(
      PaymentDataSource(),
    )
    ..registerSingleton<IPostgresUserDataSource>(
      PostgresUserDataSource(
        i.get(),
      ),
    )
    ..registerSingleton<ICallerDataSource>(
      CallerDataSource(),
    );
}
