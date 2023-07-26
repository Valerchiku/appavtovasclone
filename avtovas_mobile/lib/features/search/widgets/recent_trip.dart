import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripWidget extends StatelessWidget {
  const RecentTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.recentTripBackground,
            borderRadius: BorderRadius.circular(CommonDimensions.recentTripRadius),),
        width: CommonDimensions.recentTripWidth,
        height: CommonDimensions.recentTripHeight,
        margin: const EdgeInsets.only(
          left: CommonDimensions.recentTripMarginLeft,
        ),
        padding: const EdgeInsets.only(
            left: CommonDimensions.recentTripPaddingLeft,
            top: CommonDimensions.recentTripPaddingTop,),
        child: const Text('Алатырь -\nНовочебоксарск'),);
  }
}
