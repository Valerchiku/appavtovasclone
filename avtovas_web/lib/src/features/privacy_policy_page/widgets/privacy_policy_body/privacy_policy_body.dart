import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyBody extends StatelessWidget {
  final bool smartLayout;
  const PrivacyPolicyBody({
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
            context.locale.privacyPolicy,
            style: context.themeData.textTheme.displayMedium?.copyWith(),
          ),
          Text(
            context.locale.privacyPolicyText,
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
