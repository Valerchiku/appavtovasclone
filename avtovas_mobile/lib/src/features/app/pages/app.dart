import 'package:avtovas_mobile/features/search/pages/search_page.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/theme_type.dart';
import 'package:avtovas_mobile/src/features/app/cubit/app_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class App extends StatelessWidget {
  const App({super.key});

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

          return ThemeProvider(
            theme: theme,
            themeData: generateThemeData(theme),
            child: Builder(
              builder: (context) {
                return MaterialApp(
                  localizationsDelegates:
                      AvtovasLocalization.localizationsDelegates,
                  supportedLocales: AvtovasLocalization.supportedLocales,
                  home: const SearchPage(),
                  theme: context.themeData,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
