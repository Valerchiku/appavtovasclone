import 'package:avtovas_web/src/common/constants/app_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_section.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasContactsAside extends StatelessWidget {
  const AvtovasContactsAside({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localePath = context.locale;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AvtovasContactsInfoSection(
          title: localePath.technicalSupportService,
          firstSvgPath: AppAssets.phoneIcon,
          secondSvgPath: AppAssets.twentyFourHoursIcon,
          firstLabel: '8 (800) 700 - 02 - 40',
          secondLabel: localePath.twentyFourHours,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
        AvtovasContactsInfoSection(
          title: localePath.centralBusStationHelpline,
          firstSvgPath: AppAssets.phoneIcon,
          secondSvgPath: AppAssets.calendarIcon,
          firstLabel: '+7 (8352) 28-90-00',
          secondLabel: localePath.dailyFromFiveToTwenty,
        ),
      ],
    );
  }
}
