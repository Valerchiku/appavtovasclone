import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/shared_cubit/base_page_cubit/base_page_cubit.dart';
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_web/src/features/main/cubit/main_search_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_web/src/features/ticketing/cubit/ticketing_cubit.dart';
import 'package:avtovas_web/src/features/trip-details/cubit/trip_details_cubit.dart';
import 'package:avtovas_web/src/features/trips-schedule/cubit/trips_schedule_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<ThemeSharedCubit>(
      ThemeSharedCubit(),
    )
    ..registerSingleton<BasePageCubit>(
      BasePageCubit(
        i.get(),
      ),
    );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<MainSearchCubit>(
      () => MainSearchCubit(
        i.get(),
      ),
    )
    ..registerFactory<MyTripsCubit>(
      () => MyTripsCubit(
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
    )
    ..registerFactory<PassengersCubit>(
      () => PassengersCubit(
        i.get(),
      ),
    )
    ..registerFactory<TripsScheduleCubit>(
      () => TripsScheduleCubit(
        i.get(),
      ),
    )
    ..registerFactory<TripDetailsCubit>(
      () => TripDetailsCubit(
        i.get(),
      ),
    );
}
