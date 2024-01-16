import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsContractOfferPageBody extends StatelessWidget {
  const TermsContractOfferPageBody({
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
          context.locale.contractOfferAgreement,
          style: context.themeData.textTheme.displayMedium?.copyWith(),
        ),
        Text(
          context.locale.contractOfferAgreementSectionOne,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionTwo,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionThree,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionFour,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionFive,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionSix,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionSeven,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionEight,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        Text(
          context.locale.contractOfferAgreementSectionNine,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.quaternaryTextColor,
            fontWeight: AppFonts.weightRegular,
          ),
        ),
      ],
    );
  }
}
