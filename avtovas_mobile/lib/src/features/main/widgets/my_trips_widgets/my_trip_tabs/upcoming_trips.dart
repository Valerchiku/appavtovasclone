import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTrips extends StatelessWidget {
  final MyTripsCubit cubit;

  const UpcomingTrips({
    required this.cubit,
    super.key,
  });

  void _paymentErrorListener(BuildContext context) {
    SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return const AvtovasAlertDialog(
          title: 'Ошибка во время платежа.\nПлатёж не принят.',
          withCancel: false,
        );
      },
    );
  }

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
          padding: const EdgeInsets.all(AppDimensions.large),
          itemCount: upcomingTrips.length,
          separatorBuilder: (_, __) {
            return const SizedBox(height: AppDimensions.medium);
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
                    onPayTap: () {
                      cubit
                        ..setPaidTripUuid(trip.uuid)
                        ..startPayment(
                          trip.saleCost,
                          '${context.locale.route}: '
                          '${trip.trip.departure.name} - '
                          '${trip.trip.destination.name}',
                          () => _paymentErrorListener(context),
                        );
                    },
                    tripRemoveCallback: () {
                      cubit.updateTripStatus(
                        trip.uuid,
                        UserTripStatus.archive,
                        UserTripCostStatus.expiredReverse,
                      );
                    },
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
