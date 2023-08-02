import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/utils/theme_type.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_mobile/src/features/main_search/pages/main_search_page.dart';
import 'package:avtovas_mobile/src/features/passengers/pages/passengers_screen.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();

  @override
  void initState() {
    super.initState();

    _overlayCubit.applyStyle(
      _calculateSystemOverlay(),
    );
  }

  AvtovasTheme _avtovasTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
      ThemeType.dark => throw UnimplementedError(),
    };
  }

  SystemUiOverlayStyle _calculateSystemOverlay([ThemeType? themeType]) {
    final lightStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    const darkStyle = SystemUiOverlayStyle.dark;

    if (themeType != null) {
      return switch (themeType) {
        ThemeType.light => lightStyle,
        ThemeType.dark => darkStyle,
      };
    }

    return lightStyle;
  }

  void _overlayListener(
    ThemeType themeType,
    AppOverlayState state,
  ) {
    if (state.shouldReset) {
      _overlayCubit.reset(
        _calculateSystemOverlay(themeType),
      );
    } else if (state.shouldUpdateRoot) {
      _overlayCubit.replaceRoot(
        _calculateSystemOverlay(themeType),
      );
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        state.style!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppOverlayCubit>(
      child: CubitScope<AppCubit>(
        child: CubitScope<NavigationPanelCubit>(
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, appState) {
              final theme = _avtovasTheme(appState);
              return ThemeProvider(
                theme: theme,
                themeData: generateThemeData(theme),
                child: BlocConsumer<AppOverlayCubit, AppOverlayState>(
                  bloc: _overlayCubit,
                  listener: (context, state) => _overlayListener(
                    appState.themeType,
                    state,
                  ),
                  builder: (context, state) {
                    return MaterialApp(
                      localizationsDelegates:
                          AvtovasLocalization.localizationsDelegates,
                      supportedLocales: AvtovasLocalization.supportedLocales,
                      home: const PassengersScreen(),
                      theme: context.themeData,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
