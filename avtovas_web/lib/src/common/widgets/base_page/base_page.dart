import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_web/src/common/widgets/avtovas_footer/avtovas_footer.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

typedef FlexibleLayoutBuilder = Widget Function(
  // ignore: avoid_positional_boolean_parameters
  bool smartLayout,
  bool mobileLayout,
);

class BasePageBuilder extends StatefulWidget {
  final FlexibleLayoutBuilder layoutBuilder;

  const BasePageBuilder({
    required this.layoutBuilder,
    super.key,
  });

  @override
  State<BasePageBuilder> createState() => _BasePageBuilderState();
}

class _BasePageBuilderState extends State<BasePageBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _drawerController;
  late final Animation<double> _drawerAnimation;

  var _hasDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _drawerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..value = 0;

    _drawerAnimation = CurvedAnimation(
      parent: _drawerController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _openDrawer() {
    _drawerController.forward();
    setState(() => _hasDrawerOpen = true);
  }

  void _closeDrawer() {
    if (_drawerAnimation.value == 0) return;

    _drawerController.reverse();
    setState(() => _hasDrawerOpen = false);
  }

  @override
  void dispose() {
    _drawerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          final maxLayoutWidth = constraints.maxWidth;
          final smartLayout = maxLayoutWidth <= AppDimensions.maxNonSmartWidth;
          final mobileLayout = maxLayoutWidth <= AppDimensions.maxMobileWidth;

          return Stack(
            children: [
              ListView(
                children: [
                  AvtovasAppBar(
                    smartLayout: smartLayout,
                    onMenuButtonTap: _openDrawer,
                  ),
                  const SizedBox(height: AppDimensions.medium),
                  widget.layoutBuilder(smartLayout, mobileLayout),
                  const SizedBox(height: AppDimensions.large),
                  AvtovasFooter(smartLayout: smartLayout),
                ],
              ),
              GestureDetector(
                onTap: _closeDrawer,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: KeyedSubtree(
                    key: ValueKey<bool>(_hasDrawerOpen),
                    child: _hasDrawerOpen
                        ? SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height,
                            child: const ColoredBox(color: Colors.black26),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizeTransition(
                  sizeFactor: _drawerAnimation,
                  axis: Axis.horizontal,
                  child: SizedBox(
                    width: AppDimensions.drawerWidth,
                    height: MediaQuery.sizeOf(context).height,
                    child: ColoredBox(
                      color: context.theme.mainAppColor,
                      child: Column(
                        children: [
                          AvtovasVectorButton(
                            onTap: _closeDrawer,
                            svgAssetPath: WebAssets.cardIcon,
                          ),
                        ],
                      ),
                    ),
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
