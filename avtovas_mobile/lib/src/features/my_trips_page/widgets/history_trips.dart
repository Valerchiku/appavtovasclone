import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class HistoryTrips extends StatelessWidget {
  final MockTrip mockTrip;
  final List<String> trips;
  const HistoryTrips({
    required this.mockTrip,
    required this.trips,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips.isEmpty) {
      return Text(
        context.locale.noCompletedTrips,
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      );
    } else if (trips.isNotEmpty) {
      return Center(
        child: Text(
          'WILL BE ADDED SOON',
          style: context.themeData.textTheme.displayMedium?.copyWith(
            color: context.theme.fivefoldTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Center(
      child: Text(
        'SMTH WENT WRONG',
        style: context.themeData.textTheme.displayMedium?.copyWith(
          color: context.theme.fivefoldTextColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
