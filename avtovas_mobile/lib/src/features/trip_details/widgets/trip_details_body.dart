import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:common/src/utils/string_extension.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

final class TripDetailsBody extends StatelessWidget {
  final Trip trip;

  const TripDetailsBody({
    required this.trip,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontSize: AppFonts.sizeHeadlineLarge,
                    fontWeight: FontWeight.normal,
                    color: context.theme.quaternaryTextColor,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                PrimaryTripDetailsContainer(
                  departureName: trip.departure.name,
                  arrivalName: trip.destination.name,
                  departureDateTime: trip.departureTime,
                  arrivalDateTime: trip.arrivalTime,
                  timeInRoad: trip.duration.formatDuration(),
                  departureAddress: trip.departure.address,
                  arrivalAddress: trip.destination.address,
                ),
                const SizedBox(height: AppDimensions.medium),
                Text(
                  context.locale.carrier,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontSize: AppFonts.sizeHeadlineLarge,
                    fontWeight: FontWeight.normal,
                    color: context.theme.quaternaryTextColor,
                  ),
                ),
                const SizedBox(height: AppDimensions.medium),
                SecondaryTripDetailsContainer(
                  carrierCompany: trip.carrierData.carrierName,
                  transport: trip.bus.name,
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
              ticketPrice: Mocks.trip.ticketPrice,
              freePlaces: Mocks.trip.freePlaces,
              isSmart: true,
              onBuyTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
