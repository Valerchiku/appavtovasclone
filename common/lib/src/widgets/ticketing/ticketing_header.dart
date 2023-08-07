import 'package:common/avtovas_common_themes.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

final class TicketingHeader extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;
  final String tripDateTime;
  final String tripPrice;

  const TicketingHeader({
    required this.departurePlace,
    required this.arrivalPlace,
    required this.tripDateTime,
    required this.tripPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.large),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.medium + 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$departurePlace - $arrivalPlace',
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                color: context.theme.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: CommonFonts.detailsDescSize,
              ),
            ),
            const SizedBox(height: CommonDimensions.medium),
            Text(
              '$tripDateTime, $tripPrice',
              style: context.themeData.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
