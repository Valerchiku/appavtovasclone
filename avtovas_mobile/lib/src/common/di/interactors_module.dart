import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';

void initInteractors() {
  i
    ..registerSingleton<AppIntercator>(
      AppIntercator(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<SearchInteractor>(
      () => SearchInteractor(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<TripsScheduleInteractor>(
      () => TripsScheduleInteractor(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<TripDetailsInteractor>(
      () => TripDetailsInteractor(
        i.get(),
      ),
    )
    ..registerFactory<ProfileInteractor>(
      () => ProfileInteractor(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<TicketingInteractor>(
      () => TicketingInteractor(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<AuthorizationInteractor>(
      () => AuthorizationInteractor(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<PassengersInteractor>(
      () => PassengersInteractor(
        i.get(),
      ),
    );
}
