import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyTripBookingTimer extends StatelessWidget {
  final String bookingTimer;
  const MyTripBookingTimer({
    required this.bookingTimer,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.locale.bookingEndsIn} $bookingTimer',
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontWeight: CommonFonts.weightRegular,
        color: context.theme.reservationExpiryColor,
      ),
    );
  }
}
