import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/data/repository/payment_repository.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/core/domain/interfaces/i_payment_repository.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/avtovas_repository.dart';

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
