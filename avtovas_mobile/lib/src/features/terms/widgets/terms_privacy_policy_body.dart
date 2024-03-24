import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsPrivacyPolicyPageBody extends StatelessWidget {
  const TermsPrivacyPolicyPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Text(
          context.locale.privacyPolicy,
          style: context.themeData.textTheme.displayMedium?.copyWith(),
        ),
        Text(
          context.locale.privacyPolicyText,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
      ],
    );
  }
}
