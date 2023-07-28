// ignore: implementation_imports
import 'package:avtovas_mobile/src/features/help_info/widgets/item.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpInfoPageBody extends StatelessWidget {
  const HelpInfoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: CommonDimensions.rootPaddingTop - CommonDimensions.itemMarginTop,
        left: CommonDimensions.rootPaddingHorizontal,
        right: CommonDimensions.rootPaddingHorizontal,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Item(
              title: context.locale.whatTripsAreThere,
              content: context.locale.whatTripsAreThereContent,
              onSelected: () {
                // TODO(gleb_dyakov): implementation, 2023/07/28
              },
            ),
            Item(
              title: context.locale.willThereBeATrip,
              content: context.locale.willThereBeATripContent,
              onSelected: () {
                // TODO(gleb_dyakov): implementation, 2023/07/28
              },
            ),
            Item(
              title:
              context.locale.howFarInAdvanceDoYouNeedToBuyATicket,
              content: context
                  .locale.howFarInAdvanceDoYouNeedToBuyATicketContent,
              onSelected: () {
                // TODO(gleb_dyakov): implementation, 2023/07/28
              },
            ),
            Item(
              title: context.locale.howToCalculateTravelTimeAndArrivalTime,
              content: context
                  .locale.howToCalculateTravelTimeAndArrivalTimeContent,
              onSelected: () {
                // TODO(gleb_dyakov): implementation, 2023/07/28
              },
            ),
          ],
        ),
      ),
    );
  }
}
