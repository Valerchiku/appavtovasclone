import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/data/data_source/interfaces/i_payment_data_source.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/data/data_source/payment_data_source.dart';
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
