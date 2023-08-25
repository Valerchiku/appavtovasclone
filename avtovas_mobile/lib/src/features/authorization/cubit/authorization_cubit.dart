import 'dart:async';

import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/route_helper.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
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
          ),
        );

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
    if (state.expectedCode == currentCode) {
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
        state.copyWith(
          route: const CustomRoute.pop(),
        ),
      );
    }
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

  void onNavigationItemTap(int navigationIndex) {
    emit(
      state.copyWith(
        route: RouteHelper.routeByIndex(navigationIndex),
      ),
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
