import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
// import 'package:avtovas_web/src/common/utils/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripsScheduleBody extends StatelessWidget {
  const TripsScheduleBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final isNonSmart = maxWidth > WebDimensions.maxNonSmartWidth;
        final isSmart = maxWidth <= WebDimensions.maxNonSmartWidth;
        return ListView(
          padding: EdgeInsets.only(
            left: isNonSmart
                ? WebDimensions.rootPaddingLeft
                : WebDimensions.large,
          ),
          children: [
            Text(
              'Главная / Расписание маршрутов ',
              style: context.themeData.textTheme.headlineSmall?.copyWith(
                color: context.theme.assistiveTextColor,
                fontWeight: WebFonts.weightRegular,
              ),
            ),
            Row(
              children: [
                AvtovasVectorImage(
                  svgAssetPath: WebAssets.leftArrowIcon,
                ),
                
              ],
            ),
          ],
        );
      },
    );
  }
}
