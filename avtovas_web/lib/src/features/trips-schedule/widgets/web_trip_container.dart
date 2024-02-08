import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';

import 'package:common/avtovas_trip_container.dart';
import 'package:flutter/material.dart';

final class WebTripContainer extends StatelessWidget {
  final VoidCallback onTap;
  final String ticketPrice;
  final String departurePlace;
  final String arrivalPlace;
  final String departureDateTime;
  final String freePlaces;
  final String tripNumber;
  final String tripRoot;
  final String timeInRoad;
  final String arrivalDateTime;

  const WebTripContainer({
    required this.onTap,
    required this.ticketPrice,
    required this.freePlaces,
    required this.tripNumber,
    required this.tripRoot,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.timeInRoad,
    required this.departureDateTime,
    required this.arrivalDateTime,
    super.key,
  });

  double? _tripLineWidth(double maxWidth) {
    return AvtovasPlatform.isWeb
        ? maxWidth >= CommonDimensions.maxNonSmartWidth
            ? CommonDimensions.expandedTripLineWidth
            : null
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmart = MediaQuery.sizeOf(context).width <= 1000;
        final isWeb = AvtovasPlatform.isWeb;

        return Padding(
          padding: const EdgeInsets.only(
            bottom: CommonDimensions.large,
          ),
          child: Material(
            color: context.theme.containerBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(CommonDimensions.large),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(
                Radius.circular(AppDimensions.large),
              ),
              child: Container(
                padding: const EdgeInsets.all(
                  AppDimensions.large,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppDimensions.large),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TripHeader(
                                tripNumber: tripNumber,
                                tripRoot: tripRoot,
                              ),
                              const SizedBox(height: AppDimensions.medium),
                              TripTitle(
                                departurePlace: departurePlace,
                                arrivalPlace: arrivalPlace,
                              ),
                              const SizedBox(height: CommonDimensions.large),
                              TripLine.horizontal(
                                maxSize: _tripLineWidth(constraints.maxWidth),
                                firstPointTitle: departureDateTime.formatTime(),
                                secondPointTitle: arrivalDateTime.formatTime(),
                                lineDescription: timeInRoad.formatDuration(),
                                secondPointSubtitle:
                                    arrivalDateTime.formatDay(context),
                                firstPointSubtitle:
                                    departureDateTime.formatDay(context),
                              ),
                              if (isSmart) ...[
                                const SizedBox(height: CommonDimensions.medium),
                                ExpandedTripInformation(
                                  ticketPrice: ticketPrice,
                                  freePlaces: freePlaces,
                                  canTapOnBuy: true,
                                  isSmart: isSmart,
                                  onBuyTap: onTap,
                                ),
                              ],
                            ],
                          ),
                        ),
                        if (isWeb && !isSmart) ...[
                          const SizedBox(width: AppDimensions.large),
                          ExpandedTripInformation(
                            ticketPrice: ticketPrice,
                            freePlaces: freePlaces,
                            isSmart: isSmart,
                            canTapOnBuy: true,
                            onBuyTap: onTap,
                          ),
                          const SizedBox(width: CommonDimensions.extraLarge),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
