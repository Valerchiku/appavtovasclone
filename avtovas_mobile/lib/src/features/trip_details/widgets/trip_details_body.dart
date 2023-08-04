import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/utils/mocks.dart';
import 'package:flutter/material.dart';

final class TripDetailsBody extends StatelessWidget {
  const TripDetailsBody({super.key});

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
                const PrimaryTripDetailsContainer(
                  trip: Mocks.trip,
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
                  carrierCompany: Mocks.trip.carrier,
                  transport: Mocks.trip.transport,
                ),
                const SizedBox(height: AppDimensions.medium),
                Row(
                  children: [
                    AvtovasButton.icon(
                      buttonText: context.locale.returnConditions,
                      svgPath: AppAssets.shareIcon,
                      buttonColor: context.theme.transparent,
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
