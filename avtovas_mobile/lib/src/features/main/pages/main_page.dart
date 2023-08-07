import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/main/cubit/main_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/main_body_selector.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  void _panelListener([MainState? state, int? index]) {
    if (index != null) {
      _pageController.jumpToPage(index);
    }

    if (state != null) {}
  }

  bool _panelListenWhen(
    NavigationPanelState prev,
    NavigationPanelState current,
  ) {
    return prev.navigationIndex != current.navigationIndex;
  }

  String? _appBarTitle(BuildContext context, int pageIndex) =>
      switch (pageIndex) {
        0 => null,
        1 => context.locale.myTrips,
        2 => context.locale.help,
        3 => context.locale.profile,
        _ => throw UnimplementedError(),
      };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationPanelCubit,
      listenWhen: _panelListenWhen,
      listener: (_, state) => _panelListener(null, state.navigationIndex),
      builder: (context, navState) {
        return CubitScope<MainCubit>(
          child: BaseNavigationPage<MainPage>(
            appBarTitle: _appBarTitle(context, navState.navigationIndex),
            body: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                return BodySelector(
                  pageController: _pageController,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
