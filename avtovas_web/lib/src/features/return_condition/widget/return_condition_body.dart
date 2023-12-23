import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ReturnConditionBody extends StatelessWidget {
  final bool smartLayout;
  const ReturnConditionBody({
    required this.smartLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
        vertical: smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.returnConditions,
            style: context.themeData.textTheme.displayMedium?.copyWith(),
          ),
          Text(
            context.locale.returnFivePercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.returnFiftheenPercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.returnTwentyFivePercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.returnTwentyFivePercentExcuse,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.returnNineteenPercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.returnFullPrice,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
        ],
      ),
    );
  }
}
