import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/features/authorization/pages/authorization_page.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';
import 'package:avtovas_web/src/features/passengers/pages/passengers_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:common/avtovas_authorization.dart';

void initPages() {
  i
    ..registerFactory<MainSearchPage>(MainSearchPage.new)
    ..registerFactoryParam<TicketingPage, TicketingArguments, void>(
      (args, _) => TicketingPage(trip: args.trip),
    )
    ..registerFactory<AuthorizationPage>(
      () => const AuthorizationPage(
        content: AuthorizationContent.phone,
      ),
    )
    ..registerFactory<PassengersPage>(
      PassengersPage.new,
    );
}
