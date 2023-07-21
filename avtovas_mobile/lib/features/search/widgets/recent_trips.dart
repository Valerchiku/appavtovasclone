import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsWidget extends StatefulWidget {
  const RecentTripsWidget({super.key});

  @override
  State<RecentTripsWidget> createState() => _RecentTripsWidgetState();
}

class _RecentTripsWidgetState extends State<RecentTripsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(children: [RecentTripWidget(), RecentTripWidget()]),
        margin: EdgeInsets.only(top: Dimensions.recentItemsMarginTop));
  }
}
