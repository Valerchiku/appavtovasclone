import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class PageOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  const PageOptionTile({
    required this.title,
    required this.onTap,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: textStyle ??
                  context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: CommonFonts.weightRegular,
                    color: context.theme.secondaryTextColor,
                  ),
            ),
            trailing: const AvtovasVectorImage(
              svgAssetPath: ImagesAssets.forwardArrowIcon,
            ),
          ),
        ],
      ),
    );
  }
}
