import 'package:avtovas_web/src/features/help-info/utils/constants/dimensions.dart';
import 'package:avtovas_web/src/features/help-info/utils/constants/fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class HelpInfoPageBody extends StatelessWidget {
  const HelpInfoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        Dimensions.rootPadding,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.breadcrumbsPaddingBottom,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.directoryInfo}',
          ),
        ),
        Text(
          context.locale.directoryInfo,
          style: context.themeData.textTheme.titleLarge?.copyWith(
            fontSize: Fonts.titleSize,
          ),
        ),
        ExpansionContainer(
          title: Text(
            context.locale.whatTripsAreThere,
          ),
          children: [
            Text(
              context.locale.whatTripsAreThereContent,
            )
          ],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.willThereBeATrip,
          ),
          children: [
            Text(
              context.locale.willThereBeATripContent,
            ),
          ],
        ),
        ExpansionContainer(
          title: Text(
            context.locale.howFarInAdvanceDoYouNeedToBuyATicket,
          ),
          children: [
            Text(
              context.locale.howFarInAdvanceDoYouNeedToBuyATicketContent,
            ),
          ],
        ),
        ExpansionContainer(
          title: Text(context.locale.howToCalculateTravelTimeAndArrivalTime),
          children: [
            Text(
              context.locale.howToCalculateTravelTimeAndArrivalTimeContent,
            ),
          ],
        ),
      ],
    );
  }
}
