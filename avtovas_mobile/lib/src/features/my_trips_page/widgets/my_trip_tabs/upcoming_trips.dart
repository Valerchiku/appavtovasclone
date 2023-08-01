import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class UpcomingTrips extends StatelessWidget {
  final MockTrip mockTrip;
  final MockBooking mockBooking;
  final List<String> trips;
  const UpcomingTrips({
    required this.mockTrip,
    required this.mockBooking,
    required this.trips,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Center(
        child: Text(
          context.locale.noUpcomingTrips,
          style: context.themeData.textTheme.displayMedium?.copyWith(
            color: context.theme.fivefoldTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    } else if (trips.isNotEmpty) {
      return ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        children: [
          MyPaidTrip(
            orderNumber: mockBooking.orderNumber,
            mockTrip: mockTrip,
            numberOfSeats: 1,
          ),
          const SizedBox(height: AppDimensions.large),
          MyBookedTrip(
            orderNumber: mockBooking.orderNumber,
            mockTrip: mockTrip,
            bookingTimer: mockBooking.bookingTimer,
            numberOfSeats: 1,
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
