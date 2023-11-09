import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/data_sources/firestore_user_data_source.dart';
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
      /*PostgresUserDataSource(
        i.get(),
      ),*/
    )
    ..registerSingleton<ICallerDataSource>(
      CallerDataSource(),
    );
}
