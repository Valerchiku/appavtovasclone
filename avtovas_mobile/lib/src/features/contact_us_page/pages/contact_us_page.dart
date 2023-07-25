import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/contact_info_section.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/question_form.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
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
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.large,
          vertical: AppDimensions.large,
        ),
        children: [
          ContactInfoSection(
            title: localePath.technicalSupportService,
            firstSvgPath: AppAssets.phoneIcon,
            secondSvgPath: AppAssets.twentyFourHoursIcon,
            firstLabel: '8 (800) 700 - 02 - 40',
            secondLabel: localePath.twentyFourHours,
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          ContactInfoSection(
            title: localePath.centralBusStationHelpline,
            firstSvgPath: AppAssets.phoneIcon,
            secondSvgPath: AppAssets.calendarIcon,
            firstLabel: '+7 (8352) 28-90-00',
            secondLabel: localePath.dailyFromFiveToTwenty,
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          SectionTitle(title: localePath.askQuestion),
          const SizedBox(height: AppDimensions.large),
          Text(
            localePath.ourQualifiedExpertsWillHelp,
            style: themePath.titleLarge,
          ),
          const SizedBox(height: AppDimensions.extraLarge),
          QuestionForm(
            nameOnChanged: (value) {},
            emailOnChanged: (value) {},
            phoneOnChanged: (value) {},
            questionOnChanged: (value) {},
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
