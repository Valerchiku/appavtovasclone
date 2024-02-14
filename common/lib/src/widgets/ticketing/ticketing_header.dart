import 'package:common/avtovas_common.dart';
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
    final nonSmartWebLayout =
        AvtovasPlatform.isWeb && MediaQuery.sizeOf(context).width >= 1000;

    final tripInformation = [
      Text(
        '$departurePlace - $arrivalPlace${nonSmartWebLayout ? '    ' : ''}',
        maxLines: 2,
        style: context.themeData.textTheme.headlineMedium?.copyWith(
          color: context.theme.primaryTextColor,
          fontWeight: FontWeight.bold,
          fontSize: CommonFonts.detailsDescSize,
        ),
      ),
      SizedBox(
        height: nonSmartWebLayout
            ? CommonDimensions.extraLarge
            : CommonDimensions.medium,
      ),
      Text(
        '$tripDateTime, $tripPrice',
        style: context.themeData.textTheme.titleLarge,
      ),
    ];

    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.theme.containerBackgroundColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.large),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
            vertical: CommonDimensions.medium + 4,
          ),
          child: nonSmartWebLayout
              ? Row(children: tripInformation)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: tripInformation,
                ),
        ),
      ),
    );
  }
}
