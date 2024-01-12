import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/widgets/base_page/interactor/base_interactor.dart';
import 'package:common/avtovas_authorization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/domain/entities/app_entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'base_page_state.dart';

class BasePageCubit extends Cubit<BasePageState> {
  final BaseInteractor _baseInteractor;

  BasePageCubit(this._baseInteractor)
      : super(
          const BasePageState(
            isUserAuthorized: false,
          ),
        ) {
    _subscribeAll();
  }

  GoRouter get _appRouter => AppRouter.appRouter;

  StreamSubscription<User>? _userSubscription;

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = _baseInteractor.userStream.listen(_onNewUser);
  }

  void _onNewUser(User user) {
    emit(
      state.copyWith(
        isUserAuthorized:
            user.uuid.isNotEmpty && user.uuid != '-1' && user.uuid != '0',
      ),
    );
  }

  void navigateToMain() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        mainConfig(),
        shouldClearStack: true,
      ),
    );
  }

  void navigateToMyTrips() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        myTripsConfig(statusedTripId: '', paymentId: ''),
      ),
    );
  }

  void navigateToPassengers() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        passengersConfig(),
      ),
    );
  }

  void navigateToPaymentsHistory() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        paymentsHistoryConfig(),
      ),
    );
  }
  
  void navigateToContractOffer() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        contractOfferConfig(),
      ),
    );
  }

  void navigateToAuthorization() {
    _appRouter.navigateTo(
      CustomRoute(
        RouteType.navigateTo,
        authConfig(content: AuthorizationContent.phone),
      ),
    );
  }
}
