import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/help_info/utils/constants/colors.dart' as HelpInfoColors;

class HelpInfoPageBody extends StatelessWidget {
  const HelpInfoPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
            onExpansionChanged: (val) {
              // TODO
            },
            trailing: Icon(
              Icons.chevron_right,
              color: HelpInfoColors.Colors.itemIcon,
            ),
            title: Text(context.locale.what_trips_are_there),
            children: <Widget>[
            ],
            initiallyExpanded: true
        ),
        ExpansionTile(
            onExpansionChanged: (val) {
              // TODO
            },
            trailing: Icon(
              Icons.chevron_right,
              color: HelpInfoColors.Colors.itemIcon,
            ),
            title: Text(context.locale.will_there_be_a_trip),
            children: <Widget>[
            ],
            initiallyExpanded: true
        ),
        ExpansionTile(
            onExpansionChanged: (val) {
              // TODO
            },
            trailing: Icon(
              Icons.chevron_right,
              color: HelpInfoColors.Colors.itemIcon,
            ),
            title: Text(context.locale.how_far_in_advance_do_you_need_to_buy_a_ticket),
            children: <Widget>[
            ],
            initiallyExpanded: true
        ),
        ExpansionTile(
            onExpansionChanged: (val) {
              // TODO
            },
            trailing: Icon(
              Icons.chevron_right,
              color: HelpInfoColors.Colors.itemIcon,
            ),
            title: Text(context.locale.how_to_calculate_travel_time_and_arrival_time),
            children: <Widget>[
            ],
            initiallyExpanded: true
        ),
      ],
    );
  }
}