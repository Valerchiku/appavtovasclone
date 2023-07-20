
import 'package:avtovas_web/src/common/shared_cubit/theme/theme_shared_cubit.dart';
import 'package:avtovas_web/src/common/utils/theme_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final ThemeSharedCubit _themeCubit;

  AppCubit(this._themeCubit)
      : super(
          AppState(themeType: _themeCubit.state.themeType),
        ) {
    _onAppStarted();
  }

  void _onAppStarted() {
    _changeTheme(_themeCubit.state.themeType);
    _themeCubit.stream.listen(
      (state) {
        _changeTheme(state.themeType);
      },
    );
  }

  void _changeTheme(ThemeType themeType) {
    emit(
      state.copyWith(themeType: themeType),
    );
  }
}
