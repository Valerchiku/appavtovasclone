import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_completed_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class CompletedTrips extends StatelessWidget {
  final bool isSmart;
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const CompletedTrips({
    required this.isSmart,
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
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal:
            isSmart ? WebDimensions.large : WebDimensions.rootPaddingLeft,
        vertical: WebDimensions.large,
      ),
      itemCount: trips!.length,
      itemBuilder: (_, index) {
        final trip = trips![index];

        return MyCompletedTrip(
          isSmart: isSmart,
          trip: trip,
        );
      },
    );
  }
}
