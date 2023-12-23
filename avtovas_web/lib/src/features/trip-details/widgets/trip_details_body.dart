import 'dart:async';

import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/trip-details/cubit/trip_details_cubit.dart';
import 'package:avtovas_web/src/features/trip-details/widgets/trip_details_shimmer_content.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart' as html;

final class TripDetailsBody extends StatefulWidget {
  final String tripId;
  final String departure;
  final String destination;
  final TripDetailsCubit cubit;
  final bool smartLayout;

  const TripDetailsBody({
    required this.tripId,
    required this.departure,
    required this.destination,
    required this.cubit,
    required this.smartLayout,
    super.key,
  });

  @override
  State<TripDetailsBody> createState() => _TripDetailsBodyState();
}

class _TripDetailsBodyState extends State<TripDetailsBody> {
  late final StreamSubscription<html.PopStateEvent> _popSubscription;

  @override
  void initState() {
    super.initState();

    _popSubscription = html.window.onPopState.listen(
      (_) => widget.cubit.clearTrip(),
    );

    widget.cubit.getSingleTrip(
      tripId: widget.tripId,
      departure: widget.departure,
      destination: widget.destination,
    );
  }

  @override
  void dispose() {
    _popSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final headlineMedium = context.themeData.textTheme.headlineMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: context.theme.quaternaryTextColor,
    );

    return BlocBuilder<TripDetailsCubit, TripDetailsState>(
      bloc: widget.cubit,
      builder: (context, state) {
        final singleTrip = state.singleTrip;
        if (state.singleTrip == null) {
          return const TripDetailsShimmerContent();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.medium,
            horizontal: AppDimensions.extraLarge,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Главная / Расписание маршрутов',
                style: context.themeData.textTheme.bodyLarge?.copyWith(
                  fontSize: WebFonts.sizeTitleMedium,
                  color: context.theme.fivefoldTextColor,
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Row(
                children: [
                  GestureDetector(
                    onTap: widget.cubit.goPreviousPage,
                    child: AvtovasVectorImage(
                      svgAssetPath: WebAssets.backArrowIcon,
                      colorFilter: ColorFilter.mode(
                        context.theme.defaultIconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.large),
                  Flexible(
                    child: Text(
                      'Информация о рейсе',
                      style: context.themeData.textTheme.bodyLarge?.copyWith(
                        fontSize: WebFonts.sizeDisplayMedium,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.large),
              Text(
                context.locale.flight,
                style: headlineMedium,
              ),
              const SizedBox(height: AppDimensions.medium),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: PrimaryTripDetailsContainer(
                            departureName: singleTrip!.departure.name,
                            arrivalName: singleTrip.destination.name,
                            departureDateTime: singleTrip.departureTime,
                            arrivalDateTime: singleTrip.arrivalTime,
                            timeInRoad: singleTrip.duration,
                            departureAddress: singleTrip.departure.address,
                            arrivalAddress: singleTrip.destination.address,
                            waypoints: singleTrip.route,
                          ),
                        ),
                        const SizedBox(height: AppDimensions.medium),
                        Text(
                          context.locale.carrier,
                          style: headlineMedium,
                        ),
                        const SizedBox(height: AppDimensions.medium),
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryTripDetailsContainer(
                                carrierCompany: singleTrip.carrier,
                                transport: singleTrip.bus.name,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.medium),
                        Row(
                          children: [
                            AvtovasButton.icon(
                              buttonText: context.locale.returnConditions,
                              svgPath: WebAssets.shareIcon,
                              buttonColor: context.theme.transparent,
                              backgroundOpacity: 0,
                              textStyle: context.themeData.textTheme.bodyLarge
                                  ?.copyWith(
                                color: context.theme.primaryTextColor,
                              ),
                              onTap: () => widget.cubit.onReturnConditionsTap(
                            ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppDimensions.large),
                        if (widget.smartLayout) ...[
                          const Divider(),
                          ExpandedTripInformation(
                            ticketPrice: context.locale.price(
                              singleTrip.passengerFareCost,
                            ),
                            freePlaces: singleTrip.freeSeatsAmount,
                            isSmart: true,
                            onBuyTap: () => widget.cubit.onBuyButtonTap(
                              singleTrip,
                              singleTrip.status,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (!widget.smartLayout) ...[
                    const SizedBox(width: AppDimensions.extraLarge),
                    Expanded(
                      child: _SaleContainer(
                        ticketPrice:
                            context.locale.price(singleTrip.passengerFareCost),
                        freePlaces: singleTrip.freeSeatsAmount,
                        onBuyTap: () => widget.cubit.onBuyButtonTap(
                          singleTrip,
                          singleTrip.status,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _SaleContainer extends StatelessWidget {
  final String ticketPrice;
  final String freePlaces;
  final VoidCallback onBuyTap;

  const _SaleContainer({
    required this.ticketPrice,
    required this.freePlaces,
    required this.onBuyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DetailsContainer(
                      children: [
                        TicketPriceText(ticketPrice: ticketPrice),
                        FreePlacesBody(freePlaces: freePlaces),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.medium),
              Row(
                children: [
                  Expanded(
                    child: AvtovasButton.text(
                      buttonText: context.locale.buyTicket,
                      onTap: onBuyTap,
                      margin: EdgeInsets.zero,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppDimensions.mediumLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
