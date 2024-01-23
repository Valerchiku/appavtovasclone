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
  final ValueSetter<bool> onErrorAction;

  const UpcomingTrips({
    required this.cubit,
    required this.onErrorAction,
    super.key,
  });

  Future<void> _showRefundDialog(
    BuildContext context,
    VoidCallback refundTicket,
    String saleCost,
    String departureTime,
  ) async {
    final refundDate = await TimeReceiver.fetchUnifiedTime();

    final refundCost = RefundCostHandler.calculateRefundCostAmount(
      tripCost: saleCost,
      departureDate: DateTime.parse(departureTime),
      refundDate: refundDate,
    ).toString();

    if (!context.mounted) return;

    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: context.locale.refundMessage(refundCost),
          okayCallback: refundTicket,
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
                          () => onErrorAction(true),
                          trip.tripDbName,
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
                    onRefundTap: () => _showRefundDialog(
                      context,
                      () => cubit.refundTicket(
                        dbName: trip.tripDbName,
                        paymentId: trip.paymentUuid!,
                        tripCost: trip.saleCost,
                        departureDate: DateTime.parse(trip.trip.departureTime),
                        refundedTrip: trip,
                        errorAction: () => onErrorAction(false),
                      ),
                      trip.saleCost,
                      trip.trip.departureTime,
                    ),
                    orderNumber: trip.trip.routeNum,
                    userEmail: cubit.getUserEmail(),
                  );
          },
        );
      },
    );
  }
}
