
import 'package:common/src/localization/localizations_ext.dart';
import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/string_extension.dart';
import 'package:common/src/widgets/trip_details/details_container.dart';
import 'package:common/src/widgets/utils_widgets/expansion_container.dart';
import 'package:common/src/widgets/utils_widgets/trip_line.dart';
import 'package:flutter/material.dart';

final class PrimaryTripDetailsContainer extends StatelessWidget {
  final String departureName;
  final String arrivalName;
  final String departureDateTime;
  final String arrivalDateTime;
  final String? departureAddress;
  final String? arrivalAddress;
  final String timeInRoad;

  const PrimaryTripDetailsContainer({
    required this.departureName,
    required this.arrivalName,
    required this.departureDateTime,
    required this.arrivalDateTime,
    required this.timeInRoad,
    this.departureAddress,
    this.arrivalAddress,
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
            firstPointTitle: departureDateTime.formatHmdM(context),
            secondPointTitle: arrivalDateTime.formatHmdM(context),
            firstPointSubtitle: departureName,
            firstPointDescription: departureAddress,
            secondPointSubtitle: arrivalName,
            secondPointDescription: arrivalAddress,
          ),
          const SizedBox(height: CommonDimensions.large),
          Text(
            '${context.locale.onWay}$timeInRoad',
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
            children: const [
              /*for (final waypoint in trip.waypoints)
                Text(
                  waypoint,
                ),*/
            ],
          ),
          const SizedBox(height: CommonDimensions.medium),
        ],
      ),
    );
  }
}
