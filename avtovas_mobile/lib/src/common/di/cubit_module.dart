import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_mobile/src/features/about/pages/about_page.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_mobile/src/features/contacts/cubit/contacts_cubit.dart';
import 'package:avtovas_mobile/src/features/main/cubit/profile_cubit/profile_cubit.dart';
import 'package:avtovas_mobile/src/features/main/cubit/search_cubit/search_cubit.dart';
import 'package:avtovas_mobile/src/features/notifications/cubit/notifications_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/payments-history/cubit/payments_history_cubit.dart';
import 'package:avtovas_mobile/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/terms/cubit/terms_cubit.dart';
import 'package:avtovas_mobile/src/features/about/cubit/about_cubit.dart';

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
    ..registerFactory<SearchCubit>(
      SearchCubit.new,
    )
    ..registerFactory<NotificationsCubit>(
      NotificationsCubit.new,
    )
    ..registerFactory<PassengersCubit>(
      PassengersCubit.new,
    )
    ..registerFactory<ProfileCubit>(
      ProfileCubit.new,
    )
    ..registerFactory<TicketingCubit>(
      TicketingCubit.new,
    )
    ..registerFactory<PaymentsHistoryCubit>(
      PaymentsHistoryCubit.new,
    )
    ..registerFactory<ContactsCubit>(
      ContactsCubit.new,
    )
    ..registerFactory<TermsCubit>(
      TermsCubit.new
    )
    ..registerFactory<AboutCubit>(
      AboutCubit.new
    );
}
