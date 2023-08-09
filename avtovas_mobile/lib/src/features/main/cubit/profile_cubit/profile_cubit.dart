import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(
          const ProfileState(
            route: CustomRoute(null, null),
          ),
        ) {
    _checkAuthorizationStatus();
  }

  void onExitTap() {}

  void onSendButtonTap() {}

  void onTextTap() {}

  void onAuthorizationNumberChanged(String number) {
    emit(
      state.copyWith(authorizationNumber: number),
    );
  }

  void onPassengersButtonTap() {
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

  void _resetRoute() {
    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void _checkAuthorizationStatus() {
    // ... Check user ID from Prefs?
    emit(
      state.copyWith(isAuthorized: true),
    );
  }
}
