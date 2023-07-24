import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripWidget extends StatelessWidget {
  const RecentTripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: SearchColors.recentTripBackground,
            borderRadius: BorderRadius.circular(Dimensions.recentTripRadius),),
        width: Dimensions.recentTripWidth,
        height: Dimensions.recentTripHeight,
        margin: const EdgeInsets.only(
          left: Dimensions.recentTripMarginLeft,
        ),
        padding: const EdgeInsets.only(
            left: Dimensions.recentTripPaddingLeft,
            top: Dimensions.recentTripPaddingTop,),
        child: const Text('Алатырь -\nНовочебоксарск'),);
  }
}
