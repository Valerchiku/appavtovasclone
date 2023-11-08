import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsContractOfferPageBody extends StatelessWidget {
  final bool smartLayout;
  const TermsContractOfferPageBody({
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
          context.locale.generalProvisionsTitle,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: WebFonts.sizeHeadlineMedium,
            fontWeight: WebFonts.weightRegular,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: WebDimensions.large,
          ),
          child: Text(context.locale.generalProvisions),
        ),
      ],
    );
  }
}

class _AgreementTitle extends StatelessWidget {
  final String title;
  const _AgreementTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.themeData.textTheme.
    );
  }
}
