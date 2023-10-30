import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_web/src/features/main/cubit/main_search_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';

void initSharedCubits() {
  i.registerSingleton<ThemeSharedCubit>(
    ThemeSharedCubit(),
  );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
      ),
    )
    ..registerFactory<MainSearchCubit>(
      () => MainSearchCubit(
        i.get(),
      ),
    )
    ..registerFactory<TicketingCubit>(
      () => TicketingCubit(
        i.get(),
      ),
    )
    ..registerFactory<AuthorizationCubit>(
      () => AuthorizationCubit(
        i.get(),
      ),
    );
}
