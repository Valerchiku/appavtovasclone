import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_refund_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class RefundTrips extends StatelessWidget {
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const RefundTrips({
    required this.mockBooking,
    required this.trips,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips == null || trips!.isEmpty) {
      return Text(
        context.locale.noCompletedTrips,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimensions.large),
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimensions.large),
      itemBuilder: (context, index) => MyRefundTrip(
        trip: trips![index],
      ),
      itemCount: trips!.length,
    );
  }
}
