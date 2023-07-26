import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsWidget extends StatelessWidget {
  const RecentTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CommonDimensions.recentItemsMarginTop),
      child: Row(children: [RecentTripWidget(), RecentTripWidget()]),
    );
  }
}
