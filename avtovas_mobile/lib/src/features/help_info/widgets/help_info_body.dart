import 'package:avtovas_mobile/src/features/help_info/widgets/item.dart';
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
        Item(
          title: context.locale.what_trips_are_there,
          onSelected: () {
            // TODO
          },
        ),
        Item(
          title: context.locale.will_there_be_a_trip,
          onSelected: () {
            // TODO
          },
        ),
        Item(
          title: context.locale.how_far_in_advance_do_you_need_to_buy_a_ticket,
          onSelected: () {
            // TODO
          },
        ),
        Item(
          title: context.locale.how_to_calculate_travel_time_and_arrival_time,
          onSelected: () {
            // TODO
          },
        ),
      ],
    );
  }
}