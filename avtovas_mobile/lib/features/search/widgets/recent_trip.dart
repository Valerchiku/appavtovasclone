import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';

class RecentTripWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: SearchColors.recentTripBackground,
            borderRadius: BorderRadius.circular(Dimensions.recentTripRadius)),
        width: Dimensions.recentTripWidth,
        height: Dimensions.recentTripHeight,
        child: Text('Алатырь -\nНовочебоксарск'),
        margin: EdgeInsets.only(
          left: Dimensions.recentTripMarginLeft,
        ),
        padding: EdgeInsets.only(
            left: Dimensions.recentTripPaddingLeft,
            top: Dimensions.recentTripPaddingTop));
  }
}
