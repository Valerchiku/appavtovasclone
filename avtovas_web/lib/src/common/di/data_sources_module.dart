import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initDataSources(FlutterSecureStorage securedStorage) {
  i
    ..registerSingleton<IAvibusSettingsDataSource>(
      PostgresAvibusSettingsDataSource(),
    )
    ..registerSingleton<IOneCDataSource>(
      OneCDataSource(i.get()),
    )
    ..registerSingleton<INotificationsDataSource>(
      NotificationsDataSource(),
    )
    ..registerSingleton<ISecuredStorageDataSource>(
      SecuredStorageDataSource(securedStorage),
    )
    ..registerSingleton<IRemoteUserDataSource>(
      PostgresUserDataSource(),
    )
    ..registerSingleton<ICallerDataSource>(
      CallerDataSource(),
    )
    ..registerSingleton<ICacheDataSource>(
      CacheDataSource(),
    )
    ..registerSingleton<IPaymentDataSource>(WebPaymentDataSource())
    ..registerSingleton<IMailerDataSource>(
      MailerDataSource(),
    );
}
