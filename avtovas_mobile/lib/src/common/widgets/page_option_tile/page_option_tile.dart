import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';

// ignore_for_file: member-ordering
// ignore_for_file: avoid-border-all
// ignore_for_file: implementation_imports
// ignore_for_file: directives_ordering
// ignore_for_file: prefer_const_constructors
// ignore_for_file: no-magic-number

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

  static ExpansionTile expansion({
    required BuildContext context,
    required String title,
    Text? additionalContent,
  }) {
    final colorPath = context.theme;
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(
        vertical: CommonDimensions.large,
      ),
      shape: Border.all(
        // Might be change , depends on background color
        color: colorPath.whitespaceContainerColor,
      ),
      tilePadding: EdgeInsets.zero,
      collapsedTextColor: colorPath.secondaryTextColor,
      collapsedIconColor: colorPath.quaternaryTextColor,
      iconColor: colorPath.quaternaryTextColor,
      textColor: colorPath.mainAppColor,
      title: Text(title),
      children: [
        if (additionalContent != null) additionalContent,
      ],
    );
  }
}
