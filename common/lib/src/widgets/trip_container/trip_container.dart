import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/avtovas_platform.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/string_extension.dart';
import 'package:common/src/widgets/trip_container/expanded_trip_information.dart';
import 'package:common/src/widgets/trip_container/trip_header.dart';
import 'package:common/src/widgets/trip_container/trip_title.dart';
import 'package:common/src/widgets/utils_widgets/trip_line.dart';
import 'package:flutter/material.dart';

final class TripContainer extends StatelessWidget {
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

  const TripContainer({
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
        final isSmart = constraints.maxWidth <= 1000;
        final isWeb = AvtovasPlatform.isWeb;

        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.only(
            bottom: CommonDimensions.large,
          ),
          child: Material(
            color: isWeb ?
              context.theme.containerBackgroundColor :
              context.theme.detailsBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(CommonDimensions.large),
            ),
            child: InkWell(
              onTap: onTap,
              borderRadius: const BorderRadius.all(
                Radius.circular(CommonDimensions.large),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: CommonDimensions.large,
                  horizontal: CommonDimensions.large,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(CommonDimensions.large),
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
                              const SizedBox(height: CommonDimensions.medium),
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
                              if (isSmart)
                                const SizedBox(height: CommonDimensions.medium),
                              if (isSmart)
                                ExpandedTripInformation(
                                  canTapOnBuy: true,
                                  ticketPrice: ticketPrice,
                                  freePlaces: freePlaces,
                                  isSmart: isSmart,
                                  onBuyTap: onTap,
                                ),
                            ],
                          ),
                        ),
                        if (isWeb && !isSmart) ...[
                          ExpandedTripInformation(
                            canTapOnBuy: true,
                            ticketPrice: ticketPrice,
                            freePlaces: freePlaces,
                            isSmart: isSmart,
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
