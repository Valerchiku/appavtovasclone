import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/configurations.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/app_overlay/app_overlay_cubit.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/app_configuration_cubit.dart';
import 'package:avtovas_mobile/src/common/utils/theme_type.dart';
import 'package:avtovas_mobile/src/common/widgets/update_dialog/update_dialog.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appConfigurationCubit = i.get<AppConfigurationCubit>();
  final AppOverlayCubit _overlayCubit = i.get<AppOverlayCubit>();
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _overlayCubit.applyStyle(
      _calculateSystemOverlay(),
    );

    final initialConfig = mainConfig();

    _router = AppRouter.router(
      initialLocation: initialConfig.path,
      initialExtra: initialConfig.args,
    );

    _appConfigurationCubit.internetConnectionStatusSubscribe();
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
    const avtovasTitle = 'Вокзал21';

    return CubitScope<AppOverlayCubit>(
      child: CubitScope<AppCubit>(
        child: CubitScope<AppConfigurationCubit>(
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
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      title: avtovasTitle,
                      routerDelegate: _router.routerDelegate,
                      routeInformationParser: _router.routeInformationParser,
                      routeInformationProvider:
                          _router.routeInformationProvider,
                      backButtonDispatcher: RootBackButtonDispatcher(),
                      localizationsDelegates: const [
                        CountryLocalizations.delegate,
                        ...AvtovasLocalization.localizationsDelegates,
                      ],
                      supportedLocales: AvtovasLocalization.supportedLocales,
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
