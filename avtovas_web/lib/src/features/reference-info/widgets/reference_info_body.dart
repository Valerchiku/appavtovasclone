import 'package:avtovas_web/src/features/reference-info/utils/constants/dimensions.dart';
import 'package:avtovas_web/src/features/reference-info/utils/constants/fonts.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/cupertino.dart';

class ReferenceInfoPageBody extends StatelessWidget {
  const ReferenceInfoPageBody({super.key});

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
