import 'package:common/avtovas_common.dart';
import 'package:core/domain/entities/single_trip/single_trip_route.dart';
import 'package:flutter/material.dart';

// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: avoid_dynamic_calls

final class PrimaryTripDetailsContainer extends StatelessWidget {
  final String departureName;
  final String arrivalName;
  final String departureDateTime;
  final String arrivalDateTime;
  final String? departureAddress;
  final String? arrivalAddress;
  final String timeInRoad;
  // TODO(dev): We must not use any objects or classes from core in common.
  final List<SingleTripRoute> waypoints;

  const PrimaryTripDetailsContainer({
    required this.departureName,
    required this.arrivalName,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.timeInRoad,
    required this.waypoints,
    this.departureAddress,
    this.arrivalAddress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final headlineMediumStyle = context.themeData.textTheme.headlineMedium;
    final titleLargeStyle = context.themeData.textTheme.titleLarge;
    final subTitleTextTheme = context.themeData.textTheme.titleMedium?.copyWith(
      fontWeight: CommonFonts.weightRegular,
      color: context.theme.quaternaryTextColor,
    );
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
            firstPointTitle: departureDateTime.formatHmdM(context),
            secondPointTitle: arrivalDateTime.formatHmdM(context),
            firstPointSubtitle: departureName,
            firstPointDescription: departureAddress,
            secondPointSubtitle: arrivalName,
            secondPointDescription: arrivalAddress,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            '${context.locale.onWay}${timeInRoad.formatDuration()}',
            style: titleLargeStyle?.copyWith(
              color: context.theme.fivefoldTextColor,
            ),
          ),
          const SizedBox(height: CommonDimensions.large),
          ExpansionContainer(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            sizeBetweenChildren: CommonDimensions.large,
            title: Text(
              context.locale.waypoints,
              style: titleLargeStyle?.copyWith(
                color: context.theme.primaryTextColor,
              ),
            ),
            children: [
              for (final waypoint in waypoints)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${waypoint.arrivalTime.formatTime} ${waypoint.busStop
                          .name}',
                    ),
                    const SizedBox(height: CommonDimensions.extraSmall),
                    Text(
                      '${waypoint.busStop.address}',
                      style: subTitleTextTheme,
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: CommonDimensions.medium),
        ],
      ),
    );
  }
}
