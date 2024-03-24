import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/cubit/my_trips_cubit.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_booked_trip.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_paid_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingTrips extends StatefulWidget {
  final bool smartLayout;
  final MyTripsCubit cubit;

  const UpcomingTrips({
    required this.smartLayout,
    required this.cubit,
    super.key,
  });

  @override
  State<UpcomingTrips> createState() => _UpcomingTripsState();
}

class _UpcomingTripsState extends State<UpcomingTrips> {
  var _canBuyTicket = true;

  Future<void> _showPaymentErrorDialog(
    BuildContext context, {
    required bool fromPayment,
  }) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasAlertDialog(
          title: fromPayment
              ? 'Ошибка во время платежа.\nПлатёж не принят.'
              : 'Ошибка возврата\nВозврат не может быть принят.\n\nВы можете обратиться в техническую поддержку по текущему вопросу',
          withCancel: false,
        );
      },
    );
  }

  void _updateBuyAccess() {
    _canBuyTicket = false;

    Future.delayed(
      const Duration(milliseconds: 500),
      () => _canBuyTicket = true,
    );
  }

  Future<void> _showRefundAcceptDialog(
    BuildContext context,
    VoidCallback refundTicket,
    String tripCost,
    DateTime departureDate,
  ) async {
    final refundDate = await TimeReceiver.fetchUnifiedTime();

    final refundCostAmount = RefundCostHandler.calculateRefundCostAmount(
      tripCost: tripCost,
      departureDate: departureDate,
      refundDate: refundDate,
    );

    if (!context.mounted) return;

    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: 'Вы уверены, что хотите вернуть билет?\n'
              'Сумма возврата - $refundCostAmount РУБ.',
          okayCallback: refundTicket,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTripsCubit, MyTripsState>(
      bloc: widget.cubit,
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
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
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
                          if (!_canBuyTicket) return;

                          _updateBuyAccess();

                          widget.cubit
                            ..setPaidTripUuid(trip.uuid)
                            ..startPayment(
                              value: trip.saleCost,
                              statusedTrip: trip,
                              paymentDescription: '${context.locale.route}: '
                                  '${trip.trip.departure.name} - '
                                  '${trip.trip.destination.name}',
                              onErrorAction: () => _showPaymentErrorDialog(
                                context,
                                fromPayment: true,
                              ),
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
                        firstUserEmail: widget.cubit.firstUserEmail,
                        trip: trip,
                        onMailSendTap: (bytes) => widget.cubit.sendTicketMail(
                          ticketBytes: bytes,
                          trip: trip,
                        ),
                        onRefundTap: () {
                          Navigator.pop(context);
                          _showRefundAcceptDialog(
                            context,
                            () => widget.cubit.refundTicket(
                              dbName: trip.tripDbName,
                              paymentId: trip.paymentUuid!,
                              tripCost: trip.saleCost,
                              departureDate: DateTime.parse(
                                trip.trip.departureTime,
                              ),
                              refundedTrip: trip,
                              errorAction: () => _showPaymentErrorDialog(
                                context,
                                fromPayment: false,
                              ),
                            ),
                            trip.saleCost,
                            DateTime.parse(trip.trip.departureTime),
                          );
                        },
                        orderNumber: trip.trip.routeNum,
                      ),
            ].insertBetween(
              const SizedBox(height: AppDimensions.large),
            ),
          ),
        );
      },
    );
  }
}
