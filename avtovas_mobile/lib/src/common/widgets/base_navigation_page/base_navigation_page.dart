import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/app_configuration_cubit.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class BaseNavigationPage<T extends Widget> extends StatefulWidget {
  final Widget body;
  final String? appBarTitle;
  final String? leadingSvgPath;
  final VoidCallback? onLeadingTap;
  final ValueSetter<int>? onNavigationItemTap;
  final Widget? bottomSheet;
  final bool needNavigationPanel;

  const BaseNavigationPage({
    required this.body,
    this.onNavigationItemTap,
    this.appBarTitle,
    this.leadingSvgPath,
    this.onLeadingTap,
    this.bottomSheet,
    this.needNavigationPanel = true,
    super.key,
  });

  @override
  State<BaseNavigationPage> createState() => _BaseNavigationPageState<T>();
}

class _BaseNavigationPageState<T extends Widget>
    extends State<BaseNavigationPage> {
  final _appConfigurationCubit = i.get<AppConfigurationCubit>();

  void _onLeadingTap() {
    // Do smt if we need.

    widget.onLeadingTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: BlocBuilder<AppConfigurationCubit, AppConfigurationState>(
        bloc: _appConfigurationCubit,
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
                    _appConfigurationCubit.updateNavigationIndex(index);
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
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: state.shouldShowConnectionFailedDialog
                      ? const ColoredBox(
                          color: Colors.black38,
                          child: _InternetConnectionDialog(),
                        )
                      : null,
                ),
              ),
              if (state.shouldShowLoadingIndicator)
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: const ColoredBox(
                    color: Colors.black38,
                    child: CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

final class _InternetConnectionDialog extends StatelessWidget {
  const _InternetConnectionDialog();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        'Отсутсвует интернет соединение.\nПроверьте, подключены ли Вы к сети',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontSize: AppFonts.sizeHeadlineSmall,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
