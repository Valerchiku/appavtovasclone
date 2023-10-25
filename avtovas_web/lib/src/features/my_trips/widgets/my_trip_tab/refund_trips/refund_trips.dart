import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_refund_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class RefundTrips extends StatelessWidget {
  final bool isSmart;
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const RefundTrips({
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
      separatorBuilder: (context, index) =>
          const SizedBox(height: WebDimensions.large),
      itemBuilder: (context, index) => MyRefundTrip(
        trip: trips![index],
      ),
      itemCount: trips!.length,
    );
  }
}
