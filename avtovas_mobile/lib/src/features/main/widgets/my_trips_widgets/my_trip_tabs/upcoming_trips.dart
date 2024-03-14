import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTrips extends StatefulWidget {
  final MyTripsCubit cubit;
  final ValueSetter<bool> onErrorAction;
  final ValueChanged<bool> updatePageLoadingStatus;

  const UpcomingTrips({
    required this.cubit,
    required this.onErrorAction,
    required this.updatePageLoadingStatus,
    super.key,
  });

  @override
  State<UpcomingTrips> createState() => _UpcomingTripsState();
}

class _UpcomingTripsState extends State<UpcomingTrips> {
  var _canPayTap = true;

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
      builder: (context) {
        return AvtovasAlertDialog(
          title: context.locale.refundMessage(refundCost),
          okayCallback: refundTicket,
        );
      },
    );
  }

  void _updatePayTapPossibility() {
    Future.delayed(const Duration(milliseconds: 2000), () => _canPayTap = true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTripsCubit, MyTripsState>(
      bloc: widget.cubit,
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
                      if (!_canPayTap) return;

                      _canPayTap = false;
                      _updatePayTapPossibility();

                      widget.cubit
                        ..setPaidTripUuid(trip.uuid)
                        ..startPayment(
                          trip.saleCost,
                          '${context.locale.route}: '
                          '${trip.trip.departure.name} - '
                          '${trip.trip.destination.name}',
                          () => widget.onErrorAction(true),
                          trip.tripDbName,
                          widget.updatePageLoadingStatus,
                        );
                    },
                    tripRemoveCallback: () {
                      widget.cubit.updateTripStatus(
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
                      () => widget.cubit.refundTicket(
                        dbName: trip.tripDbName,
                        paymentId: trip.paymentUuid!,
                        tripCost: trip.saleCost,
                        refundedTrip: trip,
                        errorAction: () => widget.onErrorAction(false),
                        updatePageLoadingStatus: widget.updatePageLoadingStatus,
                      ),
                      trip.saleCost,
                      trip.trip.departureTime,
                    ),
                    orderNumber: trip.trip.routeNum,
                    userEmail: widget.cubit.getUserEmail(),
                    onSendTicketToEmailTap: (ticketBytes) =>
                        widget.cubit.sendTicketMail(
                      ticketBytes: ticketBytes,
                      trip: trip,
                    ),
                  );
          },
        );
      },
    );
  }
}
