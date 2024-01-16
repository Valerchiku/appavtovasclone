import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_refund_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class RefundTrips extends StatelessWidget {
  final MyTripsCubit cubit;
  final List<StatusedTrip>? trips;
  final MockBooking mockBooking;

  const RefundTrips({
    required this.cubit,
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
      padding: const EdgeInsets.all(AppDimensions.large),
      itemCount: trips!.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppDimensions.large),
      itemBuilder: (context, index) {
        final trip = trips![index];
        return MyRefundTrip(
          tripRemoveCallback: () => cubit.updateTripStatus(
            trip.uuid,
            UserTripStatus.archive,
            UserTripCostStatus.expiredReverse,
          ),
          trip: trips![index],
        );
      },
    );
  }
}
