import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTrips extends StatelessWidget {
  final bool isSmart;
  final MyTripsCubit cubit;

  const UpcomingTrips({
    required this.isSmart,
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTripsCubit, MyTripsState>(
      bloc: cubit,
      builder: (context, state) {
        final upcomingTrips = state.upcomingStatusedTrips;

        if (upcomingTrips == null || upcomingTrips.isEmpty) {
          return Center(
            child: Text(
              context.locale.noUpcomingTrips,
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
          itemCount: upcomingTrips.length,
          separatorBuilder: (_, __) {
            return const SizedBox(height: WebDimensions.medium);
          },
          itemBuilder: (_, index) {
            final trip = upcomingTrips[index];

            return trip.tripCostStatus == UserTripCostStatus.reserved
                ? MyBookedTrip(
                    trip: trip,
                    bookingTimer: state.timeDifferences.keys.contains(trip.uuid)
                        ? state.timeDifferences[trip.uuid]!
                        : 0,
                    onTimerEnd: (value) {},
                  )
                : MyPaidTrip(
                    trip: trip,
                    orderNumber: trip.trip.routeNum,
                  );
          },
        );
      },
    );
  }
}
