import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_interactor.dart';
import 'package:core/domain/interactors/my_tips_interactor.dart';

void initInteractors() {
  i
    ..registerSingleton<AppIntercator>(
      AppIntercator(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<SearchInteractor>(
      () => SearchInteractor(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<TripsScheduleInteractor>(
      () => TripsScheduleInteractor(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<TripDetailsInteractor>(
      () => TripDetailsInteractor(
        i.get(),
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
    )
    ..registerFactory<MyTripsInteractor>(
      () => MyTripsInteractor(
        i.get(),
        i.get(),
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<PaymentHistoryInteractor>(
      () => PaymentHistoryInteractor(
        i.get(),
      ),
    )
    ..registerFactory<NotificationInteractor>(
      () => NotificationInteractor(
        i.get(),
      ),
    );
}
