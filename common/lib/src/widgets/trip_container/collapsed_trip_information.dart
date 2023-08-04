import 'package:flutter/material.dart';

final class CollapsedTripInformation extends StatelessWidget {
  final String ticketPrice;
  final String departureTime;
  final String departureDate;

  const CollapsedTripInformation({
    required this.ticketPrice,
    required this.departureTime,
    required this.departureDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$departureDate ${context.locale.inside} $departureTime, $ticketPrice',
      style: context.themeData.textTheme.bodyLarge,
    );
  }
}
