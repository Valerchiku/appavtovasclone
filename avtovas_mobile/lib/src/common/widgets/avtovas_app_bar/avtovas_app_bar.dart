import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      value: 1,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _animateAppBarSize();
  }

  @override
  void didUpdateWidget(covariant AvtovasAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    _animateAppBarSize();
  }

  void _animateAppBarSize() {
    if (widget.title == null) {
      _animationController.animateTo(
        0,
        curve: Curves.decelerate,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      _animationController.animateTo(
        1,
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 300),
      );
    }
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
