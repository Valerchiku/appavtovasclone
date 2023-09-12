import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/trip_details/cubit/trip_details_cubit.dart';
import 'package:avtovas_mobile/src/features/trip_details/widgets/trip_details_shimmer_content.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class TripDetailsBody extends StatefulWidget {
  final String tripId;
  final String busStop;
  final TripDetailsCubit tripDetailsCubit;
  const TripDetailsBody({
    required this.tripId,
    required this.busStop,
    required this.tripDetailsCubit,
    super.key,
  });

  @override
  State<TripDetailsBody> createState() => _TripDetailsBodyState();
}

class _TripDetailsBodyState extends State<TripDetailsBody> {
  @override
  void initState() {
    super.initState();

    widget.tripDetailsCubit.getSingleTrip(
      tripId: widget.tripId,
      busStop: widget.busStop,
    );
  }

  @override
  Widget build(BuildContext context) {
    final headlineMedium = context.themeData.textTheme.headlineMedium?.copyWith(
      fontSize: AppFonts.sizeHeadlineLarge,
      fontWeight: FontWeight.normal,
      color: context.theme.quaternaryTextColor,
    );

    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      bloc: widget.tripDetailsCubit,
      builder: (context, state) {
        final singleTrip = state.singleTrip;
        if (state.singleTrip == null) {
          return const TripDetailsShimmerContent();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.medium,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.large,
                  ),
                  children: [
                    Text(
                      context.locale.flight,
                      style: headlineMedium,
                    ),
                    const SizedBox(height: AppDimensions.medium),
                    PrimaryTripDetailsContainer(
                      departureName: singleTrip!.departure.name,
                      arrivalName: singleTrip.destination.name,
                      departureDateTime: singleTrip.departureTime,
                      arrivalDateTime: singleTrip.arrivalTime,
                      timeInRoad: singleTrip.duration,
                      departureAddress: singleTrip.departure.address,
                      arrivalAddress: singleTrip.destination.address,
                      waypoints: singleTrip.route,
                    ),
                    const SizedBox(height: AppDimensions.medium),
                    Text(
                      context.locale.carrier,
                      style: headlineMedium,
                    ),
                    const SizedBox(height: AppDimensions.medium),
                    SecondaryTripDetailsContainer(
                      carrierCompany: singleTrip.carrier,
                      transport: singleTrip.bus.name,
                    ),
                    const SizedBox(height: AppDimensions.medium),
                    Row(
                      children: [
                        AvtovasButton.icon(
                          buttonText: context.locale.returnConditions,
                          svgPath: AppAssets.shareIcon,
                          buttonColor: context.theme.transparent,
                          backgroundOpacity: 0,
                          textStyle:
                              context.themeData.textTheme.bodyLarge?.copyWith(
                            color: context.theme.primaryTextColor,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.large),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.large,
                ),
                child: ExpandedTripInformation(
                  ticketPrice:
                      context.locale.price(singleTrip.passengerFareCost),
                  freePlaces: singleTrip.freeSeatsAmount,
                  isSmart: true,
                  onBuyTap: () => widget.tripDetailsCubit.onBuyButtonTap(
                    singleTrip,
                    singleTrip.status,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
