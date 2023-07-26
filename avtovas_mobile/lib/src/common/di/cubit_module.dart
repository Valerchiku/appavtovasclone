import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<ThemeSharedCubit>(
      ThemeSharedCubit(),
    )
    ..registerSingleton<NavigationPanelCubit>(
      NavigationPanelCubit(),
    );
}

void initCubits() {
  i.registerFactory<AppCubit>(
    () => AppCubit(
      i.get(),
    ),
  );
}
