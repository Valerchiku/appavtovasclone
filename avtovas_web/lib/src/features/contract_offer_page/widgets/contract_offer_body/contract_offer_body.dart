import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContractOfferBody extends StatelessWidget {
  final bool smartLayout;
  const ContractOfferBody({
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
            context.locale.contractOfferAgreement,
            style: context.themeData.textTheme.displayMedium?.copyWith(),
          ),
          Text(
            context.locale.contractOfferAgreementSectionOne,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionTwo,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionThree,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionFour,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionFive,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionSix,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionSeven,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionEight,
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: WebFonts.weightNormal,
            ),
          ),
          Text(
            context.locale.contractOfferAgreementSectionNine,
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
