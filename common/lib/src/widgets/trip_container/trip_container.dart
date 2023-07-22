import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/trip_container/expanded_trip_information.dart';
import 'package:common/src/widgets/trip_container/trip_title.dart';
import 'package:flutter/material.dart';

// ignore_for_file: TODO
// ignore_for_file: flutter_style_todos

final class TripContainer extends StatefulWidget {
  // TODO(dev): We will be use Trip entity instead of all of this params here.
  final int ticketIndex;
  final String ticketPrice;
  final String departurePlace;
  final String arrivalPlace;
  final String departureTime;
  final String departureDate;
  final String freePlaces;
  final String tripNumber;
  final String tripRoot;
  final String timeInRoad;
  final String arrivalDate;
  final String arrivalTime;

  const TripContainer({
    required this.ticketIndex,
    required this.ticketPrice,
    required this.freePlaces,
    required this.tripNumber,
    required this.tripRoot,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.timeInRoad,
    required this.departureTime,
    required this.departureDate,
    required this.arrivalTime,
    required this.arrivalDate,
    super.key,
  });

  @override
  State<TripContainer> createState() => _TripContainerState();
}

class _TripContainerState extends State<TripContainer> {
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
          padding: EdgeInsets.symmetric(
            horizontal: isSmart
                ? CommonDimensions.large
                : CommonDimensions.expandedTripMargin,
            vertical: CommonDimensions.medium,
          ),
          child: Material(
            color: context.theme.detailsBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(CommonDimensions.large),
            ),
            child: InkWell(
              onTap: () {},
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
                                tripNumber: widget.tripNumber,
                                tripRoot: widget.tripRoot,
                              ),
                              const SizedBox(height: CommonDimensions.medium),
                              TripTitle(
                                departurePlace: widget.departurePlace,
                                arrivalPlace: widget.arrivalPlace,
                              ),
                              const SizedBox(height: CommonDimensions.large),
                              TripLine.horizontal(
                                maxSize: _tripLineWidth(constraints.maxWidth),
                                firstPointTitle: widget.departureTime,
                                secondPointTitle: widget.arrivalTime,
                                lineDescription: widget.timeInRoad,
                                secondPointSubtitle: widget.arrivalDate,
                                firstPointSubtitle: widget.departureDate,
                              ),
                              if (isSmart)
                                const SizedBox(height: CommonDimensions.medium),
                              if (isSmart)
                                ExpandedTripInformation(
                                  ticketPrice: widget.ticketPrice,
                                  freePlaces: widget.freePlaces,
                                  isSmart: isSmart,
                                  onBuyTap: () {},
                                ),
                            ],
                          ),
                        ),
                        if (isWeb && !isSmart) ...[
                          ExpandedTripInformation(
                            ticketPrice: widget.ticketPrice,
                            freePlaces: widget.freePlaces,
                            isSmart: isSmart,
                            onBuyTap: () {},
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
