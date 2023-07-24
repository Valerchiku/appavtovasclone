import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/contact_info_section.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/question_form.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    final localePath = context.locale;
    return Scaffold(
      appBar: AvtovasAppBar(
        title: context.locale.call,
        svgAssetPath: AppAssets.backArrowIcon,
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.large,
        ),
        child: ListView(
          children: [
            ContactInfoSection(
              title: localePath.technicalSupportService,
              svgAssetPath: AppAssets.phoneIcon,
              svgAssetPath2: AppAssets.twentyFourHoursIcon,
              label: '8 (800) 700 - 02 - 40',
              label2: localePath.twentyFourHours,
            ),
            const SizedBox(height: CommonDimensions.extraLarge),
            ContactInfoSection(
              title: localePath.centralBusStationHelpline,
              svgAssetPath: AppAssets.phoneIcon,
              svgAssetPath2: AppAssets.calendarIcon,
              label: '+7 (8352) 28-90-00',
              label2: localePath.dailyFromFiveToTwenty,
            ),
            const SizedBox(height: CommonDimensions.extraLarge),
            SectionTitle(title: localePath.askQuestion),
            const SizedBox(height: CommonDimensions.large),
            Text(
              localePath.ourQualifiedExpertsWillHelp,
              style: themePath.titleLarge,
            ),
            const SizedBox(height: CommonDimensions.extraLarge),
            QuestionForm(
              nameOnChanged: (value) {},
              emailOnChanged: (value) {},
              phoneOnChanged: (value) {},
              questionOnChanged: (value) {},
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
