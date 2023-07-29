import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class PaymentsHistoryBody extends StatelessWidget {
  const PaymentsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AvtovasVectorImage(
          svgAssetPath: ImagesAssets.emptyPaymentsHistoryIcon,
        ),
        Text(
          context.locale.emptyPaymentsHistoryTitle,
          textAlign: TextAlign.center,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontSize: AppFonts.sizeDisplayMedium,
            color: context.theme.emptyPaymentsHistoryTitle,
          ),
        ),
      ],
    );
  }
}
