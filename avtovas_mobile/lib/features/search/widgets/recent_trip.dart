import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';

class RecentTripWidget extends StatefulWidget {
  const RecentTripWidget({super.key});

  @override
  State<RecentTripWidget> createState() => _RecentTripWidgetState();
}

class _RecentTripWidgetState extends State<RecentTripWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: SearchColors.recentTripBackground,
        child: Container(
            width: Dimensions.recentTripWidth,
            height: Dimensions.recentTripHeight,
            child: Text('Алатырь -\nНовочебоксарск'),
            padding: EdgeInsets.only(
                left: Dimensions.recentTripPaddingLeft,
                top: Dimensions.recentTripPaddingTop)));
  }
}
