import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/firestore_config_data_source.dart';
import 'package:core/data/data_sources/firestore_user_data_source.dart';
import 'package:core/data/data_sources/interfaces/i_payment_data_source.dart';
import 'package:core/data/data_sources/payment_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void initDataSources(FlutterSecureStorage securedStorage) {
  i
    ..registerSingleton<IOneCDataSource>(
      OneCDataSource(),
    )
    ..registerSingleton<ISecuredStorageDataSource>(
      SecuredStorageDataSource(securedStorage),
    )
    ..registerSingleton<IRemoteUserDataSource>(
      FireStoreUserDataSource(),
    )
    ..registerSingleton<IAvibusSettingsDataSource>(
      FireStoreAvibusSettingsDataSource(),
    )
    ..registerSingleton<IPaymentDataSource>(
      PaymentDataSource(),
    )
    /*PostgresUserDataSource(
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
      ),*/
    ..registerSingleton<ICallerDataSource>(
      CallerDataSource(),
    );
}
