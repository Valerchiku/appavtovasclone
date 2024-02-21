import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/data/repositories/payment_repository.dart';
import 'package:core/domain/interfaces/i_payment_repository.dart';

void initRepositories() {
  i
    ..registerSingleton<IOneCRepository>(
      OneCRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IPaymentRepository>(
      PaymentRepository(
        i.get(),
        i.get(),
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
    )
    ..registerSingleton<ICacheRepository>(
      CacheRepository(
        i.get(),
      ),
    )
    ..registerSingleton<INotificationsRepository>(
      NotificationsRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IMailerRepository>(
      MailerRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IAvibusSettingsRepository>(
      AvibusSettingsRepository(
        i.get(),
      ),
    )
    ..registerSingleton<IYookassaShopsRepository>(
      YookassaShopsRepository(
        i.get(),
      ),
    );
}
