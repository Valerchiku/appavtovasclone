import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

class MyTripBookingTimer extends StatelessWidget {
  final int bookingTimer;
  const MyTripBookingTimer({
    required this.bookingTimer,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.locale.bookingEndsIn} ${context.locale.minutes(bookingTimer)}',
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontWeight: CommonFonts.weightRegular,
        color: context.theme.reservationExpiryColor,
      ),
    );
  }
}
