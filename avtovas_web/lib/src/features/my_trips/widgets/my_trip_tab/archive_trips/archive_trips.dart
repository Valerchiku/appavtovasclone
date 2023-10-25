import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class ArchiveTrips extends StatelessWidget {
  final bool isSmart;
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const ArchiveTrips({
    required this.isSmart,
    required this.mockBooking,
    required this.trips,
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
      padding: EdgeInsets.symmetric(
        horizontal:
            isSmart ? WebDimensions.large : WebDimensions.rootPaddingLeft,
        vertical: WebDimensions.large,
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(height: WebDimensions.large);
      },
      itemBuilder: (_, index) => MyExpiredTrip(
        trip: trips![index],
      ),
      itemCount: trips!.length,
    );
  }
}
