import 'package:common/avtovas_common_localization.dart';
import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class BaseNavigationPage extends StatelessWidget {
  final Widget body;
  final String? appBarTitle;
  final String? leadingSvgPath;
  final VoidCallback? onLeadingTap;

  const BaseNavigationPage({
    required this.body,
    this.appBarTitle,
    this.leadingSvgPath,
    this.onLeadingTap,
    super.key,
  });

  void _onLeadingTap() {
    // Do smt if we need.

    onLeadingTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      builder: (context, state) {
        final navigationCubit = CubitScope.of<NavigationPanelCubit>(context);

        return Scaffold(
          // Проверяем, если appBarTitle не равен null, то включаем AppBar
          appBar: appBarTitle != null
              ? AvtovasAppBar(
                  svgAssetPath: leadingSvgPath,
                  title: appBarTitle!,
                  onTap: _onLeadingTap,
                )
              : null,
          body: body,
          bottomNavigationBar: AvtovasNavigationPanel(
            selectedIndex: state.navigationIndex,
            onIndexChanged: navigationCubit.updateNavigationIndex,
            items: [
              AvtovasNavigationItem(
                iconPath: AppAssets.searchIcon,
                label: context.locale.search,
              ),
              AvtovasNavigationItem(
                iconPath: AppAssets.tripsIcon,
                label: context.locale.myTrips,
              ),
              AvtovasNavigationItem(
                iconPath: AppAssets.supportIcon,
                label: context.locale.help,
              ),
              AvtovasNavigationItem(
                iconPath: AppAssets.profileIcon,
                label: context.locale.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
