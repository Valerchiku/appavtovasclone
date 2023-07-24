import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsWidget extends StatelessWidget {
  const RecentTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.recentItemsMarginTop),
      child: Row(children: [RecentTripWidget(), RecentTripWidget()]),
    );
  }
}
