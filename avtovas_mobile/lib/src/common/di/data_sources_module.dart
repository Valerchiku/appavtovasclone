import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/payment_data_source.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initDataSources(FlutterSecureStorage securedStorage) {
  i
    ..registerSingleton<IAvibusSettingsDataSource>(
      PostgresAvibusSettingsDataSource(),
    )
    ..registerSingleton<IOneCDataSource>(
      OneCDataSource(i.get()),
    )
    ..registerSingleton<ISecuredStorageDataSource>(
      SecuredStorageDataSource(securedStorage),
    )
    ..registerSingleton<IRemoteUserDataSource>(
      PostgresUserDataSource(),
    )
    ..registerSingleton<IPaymentDataSource>(
      PaymentDataSource(),
    )
    ..registerSingleton<ICacheDataSource>(
      CacheDataSource(),
    )
    ..registerSingleton<IYookassaShopsConfigDataSource>(
      PostgresYookassaShopsConfigDataSource(),
    )
    ..registerSingleton<ICallerDataSource>(
      kDebugMode ? TestCallerDataSource() : CallerDataSource(),
    )
    ..registerSingleton<INotificationsDataSource>(
      NotificationsDataSource(),
    )
    ..registerSingleton<IMailerDataSource>(
      MailerDataSource(),
    );
}
