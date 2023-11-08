import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsPrivacyPolicyBody extends StatelessWidget {
  final bool smartLayout;
  const TermsPrivacyPolicyBody({
    required this.smartLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal:
            smartLayout ? WebDimensions.large : WebDimensions.extraLarge,
        vertical: smartLayout ? WebDimensions.large : WebDimensions.extraLarge,
      ),
      children: [
        Text(
          context.locale.consentToTheProcessingOfChildPersonalData,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: WebFonts.sizeHeadlineMedium,
            fontWeight: WebFonts.weightRegular,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: WebDimensions.large,
          ),
          child: Text(
            context.locale.additionalPrecautions,
          ),
        ),
        Text(
          context.locale.methodsAndTermsOfPersonalDataProcessing,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: WebFonts.sizeHeadlineMedium,
            fontWeight: WebFonts.weightRegular,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: WebDimensions.large,
          ),
          child: Text(
            context.locale.personalDataProcessingDesc,
          ),
        ),
      ],
    );
  }
}
