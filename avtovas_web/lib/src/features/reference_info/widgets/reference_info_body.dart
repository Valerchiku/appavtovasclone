// ignore: implementation_imports
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/reference_info/widgets/reference_info_item.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:flutter/material.dart';

class ReferenceInfoBody extends StatelessWidget {
  final bool smartLayout;
  const ReferenceInfoBody({
    required this.smartLayout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal:
            smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
        vertical: smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
      ),
      shrinkWrap: true,
      children: [
        Text(
          context.locale.referenceInfo,
          style: context.themeData.textTheme.displayMedium,
        ),
        HelpInfoItem(
          title: context.locale.whatTripsAreThere,
          content: context.locale.whatTripsAreThereContent,
          onSelected: () {},
        ),
        HelpInfoItem(
          title: context.locale.willThereBeATrip,
          content: context.locale.willThereBeATripContent,
          onSelected: () {},
        ),
        HelpInfoItem(
          title: context.locale.howFarInAdvanceDoYouNeedToBuyATicket,
          content: context.locale.howFarInAdvanceDoYouNeedToBuyATicketContent,
          onSelected: () {},
        ),
        HelpInfoItem(
          title: context.locale.howToCalculateTravelTimeAndArrivalTime,
          content: context.locale.howToCalculateTravelTimeAndArrivalTimeContent,
          onSelected: () {},
        ),
      ],
    );
  }
}
