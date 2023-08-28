

import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_web/src/features/help/cubit/help_cubit.dart';
import 'package:avtovas_web/src/features/reference-info/cubit/reference_info_cubit.dart';

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
    ..registerFactory<HelpCubit>(
      HelpCubit.new,
    )
    ..registerFactory<ReferenceInfoCubit>(
      ReferenceInfoCubit.new
    )
    ..registerFactory<AvtovasContactsCubit>(
        AvtovasContactsCubit.new
    );
}
