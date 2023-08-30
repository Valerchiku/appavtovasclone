import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/features/main/utils/dialog_statuses.dart';
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
            dialogStatus: DialogStatuses.collapsed,
          ),
        ) {
    _subscribeAll();
  }

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

  void toggleDialog() {
    print('asd');
    var status = DialogStatuses.collapsed;
    switch (state.dialogStatus) {
      case DialogStatuses.collapsed:
        status = DialogStatuses.expanded;
        break;
      case DialogStatuses.expanded:
        status = DialogStatuses.collapsed;
        break;
    }
    emit(
      state.copyWith(
        dialogStatus: status,
      ),
    );
  }
}
