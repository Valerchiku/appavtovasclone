import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/pdf_generation/pdf_generation.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTrips extends StatelessWidget {
  final bool smartLayout;
  final MyTripsCubit cubit;

  const UpcomingTrips({
    required this.smartLayout,
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
          return Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
              Center(
                child: Text(
                  context.locale.noUpcomingTrips,
                  style: context.themeData.textTheme.displayMedium?.copyWith(
                    color: context.theme.fivefoldTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
            ],
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.large),
          child: Column(
            children: [
              for (final trip in upcomingTrips)
                trip.tripCostStatus == UserTripCostStatus.reserved
                    ? MyBookedTrip(
                        trip: trip,
                        bookingTimer:
                            state.timeDifferences.keys.contains(trip.uuid)
                                ? state.timeDifferences[trip.uuid]!
                                : 0,
                        onTimerEnd: (value) {},
                        onPayTap: () {
                          cubit
                            ..setPaidTripUuid(trip.uuid)
                            ..startPayment(
                              value: trip.saleCost,
                              statusedTripId: trip.uuid,
                              paymentDescription: '${context.locale.route}: '
                                  '${trip.trip.departure.name} - '
                                  '${trip.trip.destination.name}',
                              onErrorAction: () => _paymentErrorListener(
                                context,
                              ),
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
                      ),
            ].insertBetween(
              const SizedBox(height: AppDimensions.medium),
            ),
          ),
        );
      },
    );
  }
}
