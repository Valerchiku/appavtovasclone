import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_mobile/src/features/main_search/cubit/main_search_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<ThemeSharedCubit>(
      ThemeSharedCubit(),
    )
    ..registerSingleton<NavigationPanelCubit>(
      NavigationPanelCubit(),
    )
    ..registerSingleton<AppOverlayCubit>(
      AppOverlayCubit(),
    );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
      ),
    )
    ..registerFactory<TripsScheduleCubit>(
      TripsScheduleCubit.new,
    )
    ..registerFactory<MainSearchCubit>(
      MainSearchCubit.new,
    );
}
