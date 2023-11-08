import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class SelectionWidget extends StatelessWidget {
  final String vectorImagePath;
  final String title;
  final String description;
  const SelectionWidget({
    required this.vectorImagePath,
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: WebDimensions.large),
      padding: const EdgeInsets.all(WebDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.dividerColor,
        borderRadius: BorderRadius.circular(WebDimensions.small),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AvtovasVectorImage(svgAssetPath: vectorImagePath),
          const SizedBox(height: WebDimensions.small),
          Text(
            title,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              fontWeight: WebFonts.weightBold,
              fontSize: WebFonts.sizeSelectionTitle,
            ),
          ),
          Text(
            description,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: WebFonts.weightNormal,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
