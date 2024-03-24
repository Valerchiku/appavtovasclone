import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ReferenceInfoItem extends StatelessWidget {
  final String title;
  final String content;

  const ReferenceInfoItem({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionContainer(
          sizeBetweenElements: AppDimensions.large,
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
          title: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: WebFonts.sizeSelectionTitle,
                  ),
                ),
              ],
            ),
          ),
          arrowColor: context.theme.itemIcon,
          children: <Widget>[
            Text(
              content,
              style: context.themeData.textTheme.bodyLarge?.copyWith(
                fontSize: WebFonts.sizeHeadlineMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
