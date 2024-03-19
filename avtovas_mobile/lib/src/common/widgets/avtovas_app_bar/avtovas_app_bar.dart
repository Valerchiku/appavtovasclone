import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/di/injector.dart';
import 'package:avtovas_mobile/src/common/navigation/app_router.dart';
import 'package:avtovas_mobile/src/common/navigation/routes.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/app_configuration_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AvtovasAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final String? svgAssetPath;
  final VoidCallback onTap;

  const AvtovasAppBar({
    required this.onTap,
    this.title,
    this.svgAssetPath,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AvtovasAppBar> createState() => _AvtovasAppBarState();
}

class _AvtovasAppBarState extends State<AvtovasAppBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  late final AppConfigurationCubit _appConfigurator;

  @override
  void initState() {
    super.initState();

    _appConfigurator = i.get<AppConfigurationCubit>();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: _initialAnimationValue(),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    Future.delayed(Duration.zero, _animateAppBarSize);
  }

  void _animateAppBarSize() {
    widget.title == null
        ? _animationController.reverse()
        : _animationController.forward();
  }

  double _initialAnimationValue() {
    final currentRoute = _lastNavigatedRoutePath();
    final previousNavigationIndex = _appConfigurator.navigationStack.isNotEmpty
        ? _appConfigurator.navigationStack.last
        : -1;

    if (currentRoute == Routes.searchTripsPath.route &&
        _appConfigurator.state.navigationIndex == 0) {
      return 0;
    }

    if (previousNavigationIndex != -1 && previousNavigationIndex == 0) {
      return 0;
    }

    return 1;
  }

  String _lastNavigatedRoutePath() {
    final goRoute = AppRouter
        .appRouter.routerDelegate.currentConfiguration.routes.last as GoRoute;

    return goRoute.path;
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: ColoredBox(
        color: context.theme.mainAppColor,
        child: Builder(
          builder: (context) {
            return AppBar(
              surfaceTintColor: context.theme.transparent,
              backgroundColor: context.theme.mainAppColor,
              leadingWidth:
                  widget.svgAssetPath == null ? AppDimensions.none : null,
              leading: widget.svgAssetPath == null
                  ? const SizedBox()
                  : AvtovasVectorButton(
                      onTap: widget.onTap,
                      svgAssetPath: widget.svgAssetPath!,
                    ),
              title: Text(
                widget.title ?? '',
                style: context.themeData.textTheme.displaySmall?.copyWith(
                  color: context.theme.containerBackgroundColor,
                  fontWeight: AppFonts.weightRegular,
                  fontSize: AppFonts.appBarFontSize,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
