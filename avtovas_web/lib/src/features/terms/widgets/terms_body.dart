import 'package:avtovas_web/src/features/terms/utils/constants/dimensions.dart';
import 'package:avtovas_web/src/features/terms/utils/constants/fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TermsPageBody extends StatelessWidget {
  const TermsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Text(
          '${context.locale.main} / ${context.locale.help} / ${context.locale.directoryInfo}',
        ),
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.breadcrumbsPaddingBottom,
            bottom: Dimensions.titlePaddingBottom,
          ),
          child: Text(
            context.locale.termsTitle,
            style: context.themeData.textTheme.titleLarge?.copyWith(
              fontSize: Fonts.titleSize,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: Dimensions.titlePaddingBottom,
          ),
          child: Text(
            context.locale.termsSubtitle,
            maxLines: 2,
          ),
        ),
        ExpansionContainer(
          padding: EdgeInsets.only(
            bottom: Dimensions.dropdownPaddingBottom,
          ),
          title: Text(
            context.locale.privacyPolicy,
          ),
          children: [],
        ),
        ExpansionContainer(
          padding: EdgeInsets.only(
            bottom: Dimensions.dropdownPaddingBottom,
          ),
          title: Text(
            context.locale.consentToTheProcessingOfPersonalData,
          ),
          children: [],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.contractOffer,
          ),
          children: [],
        ),
      ],
    );
  }
}
