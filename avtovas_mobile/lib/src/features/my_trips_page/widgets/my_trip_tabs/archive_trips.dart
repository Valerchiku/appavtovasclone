import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ArchiveTrips extends StatelessWidget {
  final MockTrip mockTrip;
  final MockBooking mockBooking;
  final List<String> trips;
  const ArchiveTrips({
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
      return ListView.separated(
        padding: const EdgeInsets.all(AppDimensions.large),
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppDimensions.large),
        itemBuilder: (context, index) => MyExpiredTrip(
          orderNumber: mockBooking.orderNumber,
          mockTrip: mockTrip,
        ),
        itemCount: trips.length,
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
