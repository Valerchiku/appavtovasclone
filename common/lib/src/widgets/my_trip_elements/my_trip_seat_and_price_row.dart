import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripSeatAndPriceRow extends StatelessWidget {
  final String numberOfSeats;
  final String ticketPrice;

  const MyTripSeatAndPriceRow({
    required this.numberOfSeats,
    required this.ticketPrice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.locale.seat}: $numberOfSeats',
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: CommonFonts.weightRegular,
          ),
        ),
        Text(
          ticketPrice,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
