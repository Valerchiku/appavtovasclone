import 'package:avtovas_mobile/src/features/help_info/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/help_info/widgets/item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/help_info/utils/constants/colors.dart'
    as HelpInfoColors;

class HelpInfoPageBody extends StatelessWidget {
  const HelpInfoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.rootPaddingTop - Dimensions.itemMarginTop,
        left: Dimensions.rootPaddingHorizontal,
        right: Dimensions.rootPaddingHorizontal
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Item(
              title: context.locale.whatTripsAreThere,
              content: context.locale.whatTripsAreThereContent,
              onSelected: () {
                // TODO
              },
            ),
            Item(
              title: context.locale.willThereBeATrip,
              content: context.locale.willThereBeATripContent,
              onSelected: () {
                // TODO
              },
            ),
            Item(
              title:
              context.locale.howFarInAdvanceDoYouNeedToBuyATicket,
              content: context
                  .locale.howFarInAdvanceDoYouNeedToBuyATicketContent,
              onSelected: () {
                // TODO
              },
            ),
            Item(
              title: context.locale.howToCalculateTravelTimeAndArrivalTime,
              content: context
                  .locale.howToCalculateTravelTimeAndArrivalTimeContent,
              onSelected: () {
                // TODO
              },
            ),
          ],
        ),
      ),
    );
  }
}
