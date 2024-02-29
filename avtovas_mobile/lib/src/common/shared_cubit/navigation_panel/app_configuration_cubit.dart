import 'dart:async';

import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/utils/internet_connection_checker.dart';
import 'package:common/avtovas_authorization.dart';
import 'package:common/avtovas_navigation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/avtovas_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_configuration_state.dart';

class AppConfigurationCubit extends Cubit<AppConfigurationState> {
  final IUserRepository _userRepository;
  final IOneCRepository _oneCRepository;
  final IAvibusSettingsRepository _avibusSettingsRepository;
  final IYookassaShopsRepository _shopsConfigRepository;
  final ILocalAuthorizationRepository _localAuthorizationRepository;

  final _navigationStack = <int>[];

  bool get _isAuth =>
      _userRepository.entity.uuid != '-1' && _userRepository.entity.uuid != '0';

  Timer? _connectionTimer;

  AppConfigurationCubit(
    this._userRepository,
    this._oneCRepository,
    this._avibusSettingsRepository,
    this._shopsConfigRepository,
    this._localAuthorizationRepository,
  ) : super(
          const AppConfigurationState(
            navigationIndex: 0,
            isMainPage: true,
            shouldShowConnectionFailedDialog: false,
            shouldShowLoadingIndicator: false,
          ),
        );

  GoRouter get _appRouter => AppRouter.appRouter;

  StreamSubscription<ConnectivityResult>? _internetConnectionSubscription;

  bool onWillPop() {
    if (_navigationStack.isEmpty) return true;

    final lastNavigationIndex = _navigationStack.removeLast();

    if (state.navigationIndex == 0) return true;

    emit(
      state.copyWith(navigationIndex: lastNavigationIndex),
    );

    return false;
  }

  void updateNavigationIndex(int navigationIndex, {bool? isMainPage}) {
    if (state.navigationIndex == navigationIndex) return;

    _navigationStack.add(state.navigationIndex);

    emit(
      state.copyWith(
        navigationIndex: navigationIndex,
        isMainPage: isMainPage ?? state.isMainPage,
      ),
    );

    if (navigationIndex == 1 && !_isAuth) {
      _appRouter.navigateTo(
        CustomRoute(
          RouteType.navigateTo,
          authConfig(content: AuthorizationContent.phone, fromMyTrips: true),
        ),
      );
    }
  }

  void internetConnectionStatusSubscribe() {
    _internetConnectionSubscription?.cancel();
    _internetConnectionSubscription = null;

    Future.delayed(
      const Duration(seconds: 2),
      () => _internetConnectionSubscription =
          Connectivity().onConnectivityChanged.listen(_onNewInternetStatus),
    );
  }

  Future<void> _onNewInternetStatus(ConnectivityResult status) async {
    var hasInternetAccess = await InternetConnectionChecker.pingGoogle();

    print(hasInternetAccess);

    if (hasInternetAccess) {
      emit(
        state.copyWith(shouldShowConnectionFailedDialog: false),
      );
    } else {
      emit(
        state.copyWith(shouldShowConnectionFailedDialog: true),
      );
      _connectionTimer?.cancel();
      _connectionTimer = null;

      var canCompleteTimerFunc = true;

      _connectionTimer = Timer.periodic(
        const Duration(seconds: 7),
        (_) async {
          if (!canCompleteTimerFunc) return;

          hasInternetAccess = await InternetConnectionChecker.pingGoogle();

          if (hasInternetAccess) {
            canCompleteTimerFunc = false;

            emit(
              state.copyWith(shouldShowConnectionFailedDialog: false),
            );

            emit(
              state.copyWith(shouldShowLoadingIndicator: true),
            );

            final savedUserUid =
                await _localAuthorizationRepository.fetchLocalUserUuid();

            if (savedUserUid.isNotEmpty) {
              await _userRepository.fetchUser(savedUserUid);
            }

            await _avibusSettingsRepository.tryFetchConfig();
            await _shopsConfigRepository.tryFetchConfig();
            await _oneCRepository.getBusStops();

            emit(
              state.copyWith(shouldShowLoadingIndicator: false),
            );

            _connectionTimer?.cancel();
            _connectionTimer = null;
          } else {
            emit(
              state.copyWith(shouldShowConnectionFailedDialog: true),
            );
          }
        },
      );
    }
  }
}
