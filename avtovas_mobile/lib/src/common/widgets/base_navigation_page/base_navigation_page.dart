import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/utils/bottom_sheet_statuses.dart';
import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class BaseNavigationPage<T extends Widget> extends StatefulWidget {
  final Widget body;
  final String? appBarTitle;
  final String? leadingSvgPath;
  final VoidCallback? onLeadingTap;
  final ValueSetter<int>? onNavigationItemTap;
  final BottomSheetStatuses bottomSheetStatus;
  final Widget? bottomSheet;
  final bool? useRootNavigation;

  const BaseNavigationPage({
    required this.body,
    this.onNavigationItemTap,
    this.appBarTitle,
    this.leadingSvgPath,
    this.onLeadingTap,
    this.bottomSheetStatus = BottomSheetStatuses.collapsed,
    this.bottomSheet,
    this.useRootNavigation,
    super.key,
  });

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState<T>();
}

class _BaseNavigationPageState<T extends Widget>
    extends State<BaseNavigationPage> {
  final _navigationPanelCubit = i.get<NavigationPanelCubit>();

  void _onLeadingTap() {
    // Do smt if we need.

    widget.onLeadingTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationPanelCubit, NavigationPanelState>(
      bloc: _navigationPanelCubit,
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AvtovasAppBar(
                svgAssetPath: widget.leadingSvgPath,
                title: widget.appBarTitle,
                onTap: _onLeadingTap,
              ),
              body: widget.body,
              bottomNavigationBar: AvtovasNavigationPanel(
                selectedIndex: state.navigationIndex,
                onIndexChanged: (index) {
                  _navigationPanelCubit.updateNavigationIndex(index);
                  widget.onNavigationItemTap?.call(index);
                },
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
            ),
            if (widget.bottomSheet != null &&
                widget.bottomSheetStatus != BottomSheetStatuses.collapsed)
              widget.bottomSheet!
          ],
        );
      },
    );
  }
}
