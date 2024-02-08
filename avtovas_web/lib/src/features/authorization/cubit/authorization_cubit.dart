import 'dart:async';

import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            shouldShowLoading: false,
          ),
        );

  GoRouter get _appRouter => AppRouter.appRouter;

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
      emit(
        state.copyWith(shouldShowLoading: true),
      );

      final e164PhoneFormat = state.phoneNumber.stringE164PhoneFormat();

      if (e164PhoneFormat == '-1') return;

      final user = await _authorizationInteractor.fetchUserByPhone(
        e164PhoneFormat,
      );

      if (user.uuid == '0') {
        final newUser = User(
          uuid: generateUuid(),
          phoneNumber: e164PhoneFormat,
        );

        _authorizationInteractor
          ..addUser(newUser)
          ..localAuthorize(newUser.uuid);
      } else {
        _authorizationInteractor.localAuthorize(user.uuid);
      }

      emit(
        state.copyWith(shouldShowLoading: false),
      );

      _appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          mainConfig(),
          shouldReplace: true,
        ),
      );
    } else {
      emit(
        state.copyWith(isErrorCode: true),
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

  void changeContent(AuthorizationContent content) {
    emit(
      state.copyWith(content: content),
    );
  }

  void onBackButtonTap() {
    if (state.content == AuthorizationContent.code) {
      emit(
        state.copyWith(content: AuthorizationContent.phone),
      );
    } else {
      emit(
        state.copyWith(
          route: const CustomRoute.pop(),
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
}
