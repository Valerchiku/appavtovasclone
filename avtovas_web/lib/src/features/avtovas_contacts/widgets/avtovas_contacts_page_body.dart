import 'package:avtovas_web/src/common/constants/app_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/question_form.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsPageBody extends StatelessWidget {
  const AvtovasContactsPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themePath = context.themeData.textTheme;
    final localePath = context.locale;

    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.inquiry}',
          ),
        ),
        AvtovasContactsInfoSection(
          title: localePath.technicalSupportService,
          firstSvgPath: AppAssets.emptyPaymentsHistoryIcon,
          secondSvgPath: AppAssets.emptyPaymentsHistoryIcon,
          firstLabel: '8 (800) 700 - 02 - 40',
          secondLabel: localePath.twentyFourHours,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        AvtovasContactsInfoSection(
          title: localePath.centralBusStationHelpline,
          firstSvgPath: AppAssets.emptyPaymentsHistoryIcon,
          secondSvgPath: AppAssets.emptyPaymentsHistoryIcon,
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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: context.availableWidth / 3,
          ),
          child: QuestionForm(
            nameOnChanged: (value) {},
            emailOnChanged: (value) {},
            phoneOnChanged: (value) {},
            questionOnChanged: (value) {},
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
