import 'dart:async';

import 'package:avtovas_mobile/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_mobile/src/common/utils/theme_type.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AppIntercator _appIntercator;
  final ThemeSharedCubit _themeCubit;

  AppCubit(
    this._appIntercator,
    this._themeCubit,
  ) : super(
          AppState(
            toRemoteConnected: false,
            themeType: _themeCubit.state.themeType,
          ),
        ) {
    _onAppStarted();
  }

  StreamSubscription<bool>? _remoteConnectionSubscription;

  void _onAppStarted() {
    _subscribeAll();
    _changeTheme(_themeCubit.state.themeType);
    _themeCubit.stream.listen(
      (state) {
        _changeTheme(state.themeType);
      },
    );
  }

  void _subscribeAll() {
    _remoteConnectionSubscription?.cancel();
    _remoteConnectionSubscription =
        _appIntercator.remoteConnectionStream.listen(_onNewRemoteStatus);
  }

  void _onNewRemoteStatus(bool status) {
    if (status) {
      final userUuid = _appIntercator.userUuid;
      if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
        _appIntercator.fetchUser(userUuid);
        _remoteConnectionSubscription?.cancel();
        _remoteConnectionSubscription = null;
      }
    }
  }

  void _changeTheme(ThemeType themeType) {
    emit(
      state.copyWith(themeType: themeType),
    );
  }
}
