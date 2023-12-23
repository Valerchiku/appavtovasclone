import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ReturnConditionBody extends StatelessWidget {
  const ReturnConditionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.large),
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
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          Text(
            context.locale.returnFiftheenPercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          Text(
            context.locale.returnTwentyFivePercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          Text(
            context.locale.returnTwentyFivePercentExcuse,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          Text(
            context.locale.returnNineteenPercent,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
          Text(
            context.locale.returnFullPrice,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: AppFonts.weightRegular,
            ),
          ),
        ],
      ),
    );
  }
}
