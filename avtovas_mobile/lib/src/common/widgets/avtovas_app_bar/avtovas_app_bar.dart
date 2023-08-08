import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
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
  Widget build(BuildContext context) {
    return AnimatedSizedBox(
      toHeight: title == null ? AppDimensions.none : null,
      child: AppBar(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
