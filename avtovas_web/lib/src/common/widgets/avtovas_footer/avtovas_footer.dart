// ignore_for_file: implementation_imports

import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AvtovasFooter extends StatelessWidget {
  final bool smartLayout;

  const AvtovasFooter({
    required this.smartLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!smartLayout)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: WebDimensions.extraLarge,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _FooterHelp(),
                const _FooterDocuments(),
                _FooterMobileApp(isSmart: smartLayout),
              ],
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: WebDimensions.large,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const _FooterHelp(),
                const _FooterDocuments(),
                _FooterMobileApp(isSmart: smartLayout),
              ].insertBetween(
                const SizedBox(
                  height: WebDimensions.large,
                ),
              ),
            ),
          ),
        _CopyrightCookiesWidget(
          isSmart: smartLayout,
        ),
      ].insertBetween(
        const SizedBox(height: WebDimensions.extraLarge),
      ),
    );
  }
}

class _FooterHelp extends StatelessWidget {
  const _FooterHelp();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _FooterTitle(title: context.locale.help),
        // TODO(dev): Add localization
        const _FooterSubtitle(subtitle: 'Позвонить или задать вопрос'),
        _FooterSubtitle(subtitle: context.locale.directoryInfo),
        _FooterSubtitle(subtitle: context.locale.contacts),
      ].insertBetween(
        const SizedBox(height: WebDimensions.medium),
      ),
    );
  }
}

class _FooterDocuments extends StatelessWidget {
  const _FooterDocuments();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // TODO(dev): Add localization
        const _FooterTitle(title: 'Документы'),
        _FooterSubtitle(subtitle: context.locale.privacyPolicy),
        _FooterSubtitle(
          subtitle:
              context.locale.personalDataProcessingText.capitalizeFirstLetter(),
        ),
        _FooterSubtitle(
          subtitle: context.locale.contractOffer,
        ),
      ].insertBetween(
        const SizedBox(height: WebDimensions.medium),
      ),
    );
  }
}

class _FooterMobileApp extends StatelessWidget {
  final bool isSmart;

  const _FooterMobileApp({required this.isSmart});

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse('https://www.youtube.com/');

    Future<void> launchYoutube() async {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO(dev): Add localization
        const _FooterTitle(title: 'Мобильное приложение'),
        if (!isSmart)
          Row(
            children: [
              GestureDetector(
                onTap: launchYoutube,
                child: Image.asset(ImagesAssets.googlePlay),
              ),
              const SizedBox(width: CommonDimensions.medium),
              GestureDetector(
                onTap: launchYoutube,
                child: Image.asset(ImagesAssets.appStore),
              ),
            ],
          ),
        if (isSmart)
          Column(
            children: [
              GestureDetector(
                onTap: launchYoutube,
                child: Image.asset(ImagesAssets.googlePlay),
              ),
              const SizedBox(height: CommonDimensions.medium),
              GestureDetector(
                onTap: launchYoutube,
                child: Image.asset(ImagesAssets.appStore),
              ),
            ],
          ),
      ].insertBetween(
        const SizedBox(height: CommonDimensions.large),
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
  final bool isSmart;

  const _CopyrightCookiesWidget({required this.isSmart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _CopyrightCookiesText(
          text: context.locale.cookies,
          isSmart: isSmart,
        ),
        Divider(
          indent:
              isSmart ? WebDimensions.smallHorizontal : CommonDimensions.large,
          endIndent:
              isSmart ? WebDimensions.smallHorizontal : CommonDimensions.large,
        ),
        _CopyrightCookiesText(
          text: context.locale.copyright,
          isSmart: isSmart,
        ),
      ].insertBetween(
        const SizedBox(height: WebDimensions.medium),
      ),
    );
  }
}

class _CopyrightCookiesText extends StatelessWidget {
  final String text;
  final bool isSmart;

  const _CopyrightCookiesText({
    required this.isSmart,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !isSmart
          ? const EdgeInsets.symmetric(
              horizontal: WebDimensions.extraLarge,
              vertical: WebDimensions.medium,
            )
          : const EdgeInsets.symmetric(horizontal: CommonDimensions.large),
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
