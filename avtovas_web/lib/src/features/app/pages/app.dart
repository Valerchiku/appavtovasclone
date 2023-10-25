import 'package:avtovas_web/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_web/src/common/di/injector.dart';
import 'package:avtovas_web/src/common/utils/theme_type.dart';
import 'package:avtovas_web/src/features/app/cubit/app_cubit.dart';
import 'package:avtovas_web/src/features/main/pages/main_page.dart';
import 'package:avtovas_web/src/features/ticketing/pages/ticketing_page.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:core/domain/entities/single_trip/single_trip.dart';
import 'package:core/domain/entities/trip/trip.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class App extends StatefulWidget {

  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final dataSource = i.get<IOneCDataSource>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _singleTrip();
  }

  AvtovasTheme _avtovasTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
    };
  }

  Future<void> _singleTrip() async {
    final dataSource = i.get<IOneCDataSource>();

    dataSource.getTrip(
      tripId: '10bbf229-6add-11ee-a99a-92c3eec7ef37',
      departure: 'Чебоксары Центральный АВ',
      destination: 'Автовокзал Йошкар-Ола',
    );
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppCubit>(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          final theme = _avtovasTheme(state);

          return StreamBuilder(
            stream: dataSource.singleTripStream,
            builder: (context, snapshot) {



              return ThemeProvider(
                theme: theme,
                themeData: generateThemeData(theme),
                child: Builder(
                  builder: (context) {
                    return MaterialApp(
                      localizationsDelegates:
                          AvtovasLocalization.localizationsDelegates,
                      supportedLocales: AvtovasLocalization.supportedLocales,
                      home: snapshot.hasData && snapshot.data != null ? TicketingPage(trip: snapshot.data!) : const SizedBox(),
                      theme: context.themeData,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
