import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';

class AuthorizationCubit extends Cubit<AuthorizationState> {
  final AuthorizationInteractor _authorizationInteractor;

  AuthorizationCubit(this._authorizationInteractor)
      : super(
          const AuthorizationState(
            route: CustomRoute(null, null),
            content: AuthorizationContent.phone,
            phoneNumber: '',
            expectedCode: '',
            enteredCode: '',
            isErrorCode: false,
            pageLoading: false,
          ),
        );

  final _appRouter = AppRouter.appRouter;

  Future<void> onSendButtonTap() async {
    if (state.phoneNumber.isNotEmpty) {
      emit(
        state.copyWith(content: AuthorizationContent.code),
      );

      _startCallToUser();
    }
  }

  Future<void> onResendButtonTap() async {
    final expectedCode = await _authorizationInteractor.initCall(
      state.phoneNumber.integerE164PhoneFormat(),
    );

    emit(
      state.copyWith(expectedCode: expectedCode),
    );
  }

  Future<void> onCodeEntered(String currentCode) async {
    if (state.expectedCode == currentCode || kDebugMode) {
      final e164PhoneFormat = state.phoneNumber.stringE164PhoneFormat();

      if (e164PhoneFormat == '-1') return;

      emit(
        state.copyWith(pageLoading: true),
      );

      final user = await _authorizationInteractor.fetchUserByPhone(
        e164PhoneFormat,
      );

      if (user.uuid == '0') {
        final newUser = User(
          uuid: generateUuid(),
          phoneNumber: e164PhoneFormat,
        );

        await _authorizationInteractor.addUser(newUser);
        _authorizationInteractor.localAuthorize(newUser.uuid);
      } else {
        _authorizationInteractor.localAuthorize(user.uuid);
      }

      emit(
        state.copyWith(pageLoading: false),
      );

      _appRouter.pop(true);
    } else {
      emit(
        state.copyWith(isErrorCode: true),
      );

      emit(
        state.copyWith(pageLoading: false),
      );
    }
  }

  void resetErrorStatus() {
    emit(
      state.copyWith(isErrorCode: false),
    );
  }

  void onNumberChanged(String number, {bool automaticallyCall = false}) {
    emit(
      state.copyWith(phoneNumber: number),
    );

    if (automaticallyCall) {
      _startCallToUser();
    }
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

  void changeContent(AuthorizationContent content) {
    emit(
      state.copyWith(content: content),
    );
  }

  void onNavigationItemTap(int navigationIndex) {
    if (navigationIndex == 1) return;

    emit(
      state.copyWith(
        route: RouteHelper.clearedRoute(
          navigationIndex,
          shouldClearStack: true,
        ),
      ),
    );

    emit(
      state.copyWith(
        route: const CustomRoute(null, null),
      ),
    );
  }

  void onBackButtonTap({required bool fromMyTrips}) {
    if (state.content == AuthorizationContent.code) {
      emit(
        state.copyWith(content: AuthorizationContent.phone),
      );
    } else {
      emit(
        state.copyWith(
          route: fromMyTrips
              ? RouteHelper.clearedIndexedRoute(
                  0,
                  shouldClearStack: true,
                )
              : const CustomRoute.pop(),
        ),
      );
    }
  }

  Future<void> _startCallToUser() async {
    final expectedCode = await _authorizationInteractor.initCall(
      state.phoneNumber.integerE164PhoneFormat(),
    );

    emit(
      state.copyWith(expectedCode: expectedCode),
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
