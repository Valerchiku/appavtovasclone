import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileInteractor _profileInteractor;

  ProfileCubit(this._profileInteractor)
      : super(
          const ProfileState(
            route: CustomRoute(null, null),
          ),
        ) {
    _subscribeAll();
  }

  final _appRouter = AppRouter.appRouter;

  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    _userSubscription = null;

    return super.close();
  }

  void onExitTap() => _profileInteractor.deAuthorize();

  void onSendButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          authConfig(
            content: AuthorizationContent.code,
            phoneNumber: state.authorizationNumber,
          ),
        ),
      ),
    );
    _resetRoute();
  }

  void onTextTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          privacyPolicyConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onAuthorizationNumberChanged(String number) {
    emit(
      state.copyWith(authorizationNumber: number),
    );
  }

  bool _checkAuthorizationStatus() {
    final isAuth = _profileInteractor.isAuth;

    if (!isAuth) {
      _appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          authConfig(content: AuthorizationContent.phone),
        ),
      );
    }

    return isAuth;
  }

  void onPassengersButtonTap() {
    if (!_checkAuthorizationStatus()) return;

    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          passengersConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onPaymentsHistoryButtonTap() {
    if (!_checkAuthorizationStatus()) return;

    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          paymentsHistoryConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onNotificationsButtonTap() {
    if (!_checkAuthorizationStatus()) return;

    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          notificationsConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onReferenseInfoButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          referenceInfoConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onTermsButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          termsConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void onAboutButtonTap() {
    emit(
      state.copyWith(
        route: CustomRoute(
          RouteType.navigateTo,
          aboutConfig(),
        ),
      ),
    );
    _resetRoute();
  }

  void _subscribeAll() {
    _userSubscription?.cancel();
    _userSubscription = _profileInteractor.userStream.listen(
      (userUuid) {
        emit(
          state.copyWith(isAuthorized: _profileInteractor.isAuth),
        );
      },
    );
  }

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }
}
