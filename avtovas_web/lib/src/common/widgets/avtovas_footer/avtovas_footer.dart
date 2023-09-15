import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class AvtovasFooter extends StatelessWidget {
  const AvtovasFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _FooterHelp(),
              _FooterDocuments(),
              _FooterMobileApp(),
            ],
          ),
          _CopyrightCookiesWidget(),
        ],
      ),
    );
  }
}

class _FooterHelp extends StatelessWidget {
  const _FooterHelp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FooterTitle(title: context.locale.help),
          // TODO: Add localization
          const _FooterSubtitle(subtitle: 'Позвонить или задать вопрос'),
          _FooterSubtitle(subtitle: context.locale.directoryInfo),
          _FooterSubtitle(subtitle: context.locale.contacts),
        ]..insertBetween(
            const SizedBox(height: CommonDimensions.large),
          ),
      ),
    );
  }
}

class _FooterDocuments extends StatelessWidget {
  const _FooterDocuments();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Add localization
          const _FooterTitle(title: 'Документы'),
          _FooterSubtitle(subtitle: context.locale.privacyPolicy),
          _FooterSubtitle(
            subtitle: context.locale.personalDataProcessingText
                .capitalizeFirstLetter(),
          ),
          _FooterSubtitle(
            subtitle: context.locale.contractOffer,
          ),
        ]..insertBetween(
            const SizedBox(height: CommonDimensions.large),
          ),
      ),
    );
  }
}

class _FooterMobileApp extends StatelessWidget {
  const _FooterMobileApp();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TODO: Add localization
          const _FooterTitle(title: 'Мобильное приложение'),
          Row(
            children: [
              Image.asset(ImagesAssets.googlePlay),
              const SizedBox(width: CommonDimensions.medium),
              Image.asset(ImagesAssets.appStore),
            ],
          ),
        ]..insertBetween(
            const SizedBox(height: CommonDimensions.large),
          ),
      ),
    );
  }
}

class _FooterTitle extends StatelessWidget {
  final String title;
  const _FooterTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.themeData.textTheme.displaySmall?.copyWith(
        fontWeight: CommonFonts.weightRegular,
        fontSize: CommonFonts.appBarFontSize,
        color: context.theme.fivefoldTextColor,
        height: CommonFonts.sizeFactorLarge,
      ),
    );
  }
}

class _FooterSubtitle extends StatelessWidget {
  final String subtitle;
  const _FooterSubtitle({required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontWeight: CommonFonts.weightRegular,
        color: context.theme.defaultIconColor,
        height: CommonFonts.sizeFactorLarge,
      ),
    );
  }
}

class _CopyrightCookiesWidget extends StatelessWidget {
  const _CopyrightCookiesWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CopyrightCookiesText(
          text: context.locale.cookies,
        ),
        const Divider(
          indent: CommonDimensions.large,
          endIndent: CommonDimensions.large,
        ),
        _CopyrightCookiesText(
          text: context.locale.copyright,
        ),
      ],
    );
  }
}

class _CopyrightCookiesText extends StatelessWidget {
  final String text;
  const _CopyrightCookiesText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimensions.extraLarge,
        vertical: CommonDimensions.small,
      ),
      child: Text(
        text,
        style: context.themeData.textTheme.titleMedium?.copyWith(
          fontWeight: CommonFonts.weightMedium,
          color: context.theme.fivefoldTextColor,
        ),
      ),
    );
  }
}
