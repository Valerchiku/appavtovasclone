import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/interactors/ticketing_interactor.dart';

void initInteractors() {
  i
    ..registerFactory<SearchInteractor>(
      () => SearchInteractor(
        i.get(),
      ),
    )
    ..registerFactory<TripsScheduleInteractor>(
      () => TripsScheduleInteractor(
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
      ),
    )
    ..registerFactory<TicketingInteractor>(
      () => TicketingInteractor(
        i.get(),
      ),
    );
}
