import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsConsentProcessingPageBody
    extends StatelessWidget {
  const TermsConsentProcessingPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.preExtraLarge,
      ),
      children: [
        Text(
          context.locale.consentToTheProcessingOfPersonalData,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: AppFonts.sizeHeadlineMedium,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.large,
            bottom: AppDimensions.preExtraLarge,
          ),
          child: Text(
            context.locale.additionalPrecautions,
          ),
        ),
        Text(
          context.locale.methodsAndTermsOfPersonalDataProcessing,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: AppFonts.sizeHeadlineMedium,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            context.locale.personalDataProcessingDesc,
          ),
        ),
      ],
    );
  }
}
