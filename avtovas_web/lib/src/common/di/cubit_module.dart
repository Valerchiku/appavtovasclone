import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/shared_cubit/base_page_cubit/base_page_cubit.dart';
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_web/src/features/authorization/cubit/authorization_cubit.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/cubit/avtovas_contacts_cubit.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/cubit/bus_station_contacts_cubit.dart';
import 'package:avtovas_web/src/features/contract_offer_page/cubit/contract_offer_cubit.dart';
import 'package:avtovas_web/src/features/main/cubit/main_search_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_web/src/features/payments-history/cubit/payments_history_cubit.dart';
import 'package:avtovas_web/src/features/privacy_policy_page/cubit/privacy_policy_cubit.dart';
import 'package:avtovas_web/src/features/reference_info/cubit/reference_info_cubit.dart';
import 'package:avtovas_web/src/features/return_conditions_page/cubit/return_conditions_cubit.dart';
import 'package:avtovas_web/src/features/terms_of_use_page/cubit/terms_of_use_cubit.dart';
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
    )
    ..registerFactory<AvtovasContactsCubit>(
      AvtovasContactsCubit.new,
    )
    ..registerFactory<ReferenceInfoCubit>(
      ReferenceInfoCubit.new,
    )
    ..registerFactory<BusStationContactsCubit>(
      BusStationContactsCubit.new,
    )
    ..registerFactory<PrivacyPolicyCubit>(
      PrivacyPolicyCubit.new,
    )
    ..registerFactory<ContractOfferCubit>(
      ContractOfferCubit.new,
    )
    ..registerFactory<TermsOfUseCubit>(
      TermsOfUseCubit.new,
    )
    ..registerFactory<PaymentsHistoryCubit>(
      () => PaymentsHistoryCubit(
        i.get(),
      ),
    )
    ..registerFactory<ReturnConditionsCubit>(ReturnConditionsCubit.new);

  print('123');
  print(i.isRegistered<MyTripsCubit>());
}
