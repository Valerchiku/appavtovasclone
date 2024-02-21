import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/app_configuration_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/main/cubit/search_cubit/main_search_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_body_selector.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _navigationPanelCubit = i.get<AppConfigurationCubit>();

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _navigationPanelCubit.state.navigationIndex,
    );
  }

  void _panelListener([int? index]) {
    if (index != null) _pageController.jumpToPage(index);
  }

  bool _panelListenWhen(
    AppConfigurationState prev,
    AppConfigurationState current,
  ) {
    return prev.navigationIndex != current.navigationIndex;
  }

  // TODO(dev): Use Enum instead indexes;
  String? _appBarTitle(BuildContext context, int pageIndex) =>
      switch (pageIndex) {
        0 => null,
        1 => context.locale.myTrips,
        // ignore: no-magic-number
        2 => context.locale.help,
        // ignore: no-magic-number
        3 => context.locale.profile,
        _ => throw UnimplementedError(),
      };

  Future<bool> _onWillPop() async {
    if (context.canPop()) return true;

    return _navigationPanelCubit.onWillPop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppConfigurationCubit, AppConfigurationState>(
      bloc: _navigationPanelCubit,
      listenWhen: _panelListenWhen,
      listener: (_, state) => _panelListener(state.navigationIndex),
      builder: (context, navState) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: BaseNavigationPage<MainPage>(
            appBarTitle: _appBarTitle(context, navState.navigationIndex),
            body: MainBodySelector(
              pageController: _pageController,
            ),
          ),
        );
      },
    );
  }
}
