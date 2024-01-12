import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_completed_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class CompletedTrips extends StatelessWidget {
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const CompletedTrips({
    required this.trips,
    required this.mockBooking,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips == null || trips!.isEmpty) {
      return Center(
        child: Text(
          context.locale.noCompletedTrips,
          style: context.themeData.textTheme.displayMedium?.copyWith(
            color: context.theme.fivefoldTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(AppDimensions.large),
      itemCount: trips!.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppDimensions.large);
      },
      itemBuilder: (_, index) {
        final trip = trips![index];

        return MyCompletedTrip(
          trip: trip,
        );
      },
    );
  }
}
