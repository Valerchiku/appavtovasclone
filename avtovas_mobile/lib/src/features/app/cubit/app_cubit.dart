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

  void _onAppStarted() {
    _fetchAuthorizedUser();
    _changeTheme(_themeCubit.state.themeType);
    _themeCubit.stream.listen(
      (state) {
        _changeTheme(state.themeType);
      },
    );
  }

  Future<void> _fetchAuthorizedUser() async {
    final userUuid = await _appIntercator.fetchLocalUserUuid();
    if (userUuid.isNotEmpty && userUuid != '-1' && userUuid != '0') {
      await _appIntercator.fetchUser(userUuid);

      await _appIntercator.saveNewFcmToken();
    }
  }

  void _changeTheme(ThemeType themeType) {
    emit(
      state.copyWith(themeType: themeType),
    );
  }
}
