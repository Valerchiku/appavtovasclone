import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/mock_trip.dart';
import 'package:common/src/widgets/trip_details/details_container.dart';
import 'package:common/src/widgets/utils_widgets/expansion_container.dart';
import 'package:common/src/widgets/utils_widgets/trip_line.dart';
import 'package:flutter/material.dart';

final class PrimaryTripDetailsContainer extends StatelessWidget {
  final MockTrip trip;

  const PrimaryTripDetailsContainer({
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final headlineMediumStyle = context.themeData.textTheme.headlineMedium;
    final titleLargeStyle = context.themeData.textTheme.titleLarge;

    return Material(
      child: DetailsContainer(
        children: [
          Text(
            context.locale.primaryDetailsMessage,
            style: headlineMediumStyle?.copyWith(
              color: context.theme.quaternaryTextColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          TripLine.vertical(
            maxSize: CommonDimensions.verticalTripLineHeight,
            firstPointTitle: '${trip.departureTime}, ${trip.departureDate}',
            secondPointTitle: '${trip.arrivalTime}, ${trip.arrivalDate}',
            firstPointSubtitle: trip.departurePlace,
            firstPointDescription: trip.departureAddress,
            secondPointSubtitle: trip.arrivalPlace,
            secondPointDescription: trip.arrivalAddress,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            '${context.locale.onWay}${trip.timeInRoad}',
            style: titleLargeStyle?.copyWith(
              color: context.theme.fivefoldTextColor,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          ExpansionContainer(
            sizeBetweenChildren: CommonDimensions.large,
            title: Row(
              children: [
                Text(
                  context.locale.waypoints,
                  style: titleLargeStyle?.copyWith(
                    color: context.theme.primaryTextColor,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: context.theme.mainAppColor,
                ),
              ],
            ),
            children: [
              for (final waypoint in trip.waypoints)
                Text(
                  waypoint,
                ),
            ],
          ),
          const SizedBox(height: CommonDimensions.medium),
        ],
      ),
    );
  }
}
