import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class AvtovasAppBar extends StatelessWidget implements PreferredSizeWidget {
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
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.theme.mainAppColor,
      child: AnimatedSizedBox(
        toHeight: title == null ? 0 : null,
        child: AppBar(
          surfaceTintColor: context.theme.transparent,
          backgroundColor: context.theme.mainAppColor,
          leadingWidth: svgAssetPath == null ? AppDimensions.none : null,
          leading: svgAssetPath == null
              ? const SizedBox()
              : AvtovasVectorButton(
                  onTap: onTap,
                  svgAssetPath: svgAssetPath!,
                ),
          title: Text(
            title ?? '',
            style: context.themeData.textTheme.displaySmall?.copyWith(
              color: context.theme.containerBackgroundColor,
              fontWeight: AppFonts.weightRegular,
              fontSize: AppFonts.appBarFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
