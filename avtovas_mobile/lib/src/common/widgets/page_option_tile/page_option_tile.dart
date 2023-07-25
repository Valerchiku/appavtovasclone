import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class PageOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const PageOptionTile({
    required this.title,
    required this.onTap,
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
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                fontWeight: CommonFonts.weightRegular,
                color: context.theme.secondaryTextColor,
              ),
            ),
            trailing: const AvtovasVectorImage(
              svgAssetPath: AppAssets.forwardArrowIcon,
            ),
          ),
          Divider(
            height: CommonDimensions.small,
            color: context.theme.dividerColor,
          ),
        ],
      ),
    );
  }
}
