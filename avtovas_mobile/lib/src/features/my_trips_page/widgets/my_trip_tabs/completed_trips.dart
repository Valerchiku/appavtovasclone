import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/my_trip_status/my_completed_trip.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:flutter/material.dart';

class CompletedTrips extends StatelessWidget {
  final MockTrip mockTrip;
  final MockBooking mockBooking;
  final List<String> trips;
  const CompletedTrips({
    required this.mockTrip,
    required this.mockBooking,
    required this.trips,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Text(
        context.locale.noCompletedTrips,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      );
    } else if (trips.isNotEmpty) {
      return ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        children: [
          MyCompletedTrip(
            orderNumber: mockBooking.orderNumber,
            mockTrip: mockTrip,
            mockPassenger: Mocks.passengers,
          ),
        ],
      );
    }
    return Center(
      child: Text(
        context.locale.somethingWentWrong,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
