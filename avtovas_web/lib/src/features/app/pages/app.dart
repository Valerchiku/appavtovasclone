import 'package:avtovas_web/src/common/constants/app_animations.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/navigation/app_router.dart';
import 'package:avtovas_web/src/common/navigation/configurations.dart';
import 'package:avtovas_web/src/common/shared_cubit/base_page_cubit/base_page_cubit.dart';
import 'package:avtovas_web/src/common/utils/theme_type.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

final class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _shouldShowSplashLogo = true;

  @override
  void initState() {
    super.initState();

    final initialConfig = mainConfig();

    AppRouter.router(
      initialLocation: initialConfig.path,
      initialExtra: initialConfig.args,
    );

    Future.delayed(
      const Duration(seconds: 3),
      () => setState(() => _shouldShowSplashLogo = false),
    );
  }

  AvtovasTheme _avtovasTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppCubit>(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final theme = _avtovasTheme(state);

          return CubitScope<BasePageCubit>(
            child: ThemeProvider(
              theme: theme,
              themeData: generateThemeData(theme),
              child: _shouldShowSplashLogo
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/avtovas_logo_green.png'),
                        const SizedBox(height: AppDimensions.extraLarge),
                        Lottie.asset(
                          AppLottie.busLoading,
                          width: 100,
                          height: 100,

                        ),
                      ],
                    )
                  : Builder(
                      builder: (context) {
                        return MaterialApp.router(
                          title: 'Avtovas',
                          routerDelegate: AppRouter.appRouter.routerDelegate,
                          routeInformationParser:
                              AppRouter.appRouter.routeInformationParser,
                          routeInformationProvider:
                              AppRouter.appRouter.routeInformationProvider,
                          supportedLocales:
                              AvtovasLocalization.supportedLocales,
                          backButtonDispatcher: RootBackButtonDispatcher(),
                          localizationsDelegates: const [
                            CountryLocalizations.delegate,
                            ...AvtovasLocalization.localizationsDelegates,
                          ],
                          theme: context.themeData,
                        );
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
