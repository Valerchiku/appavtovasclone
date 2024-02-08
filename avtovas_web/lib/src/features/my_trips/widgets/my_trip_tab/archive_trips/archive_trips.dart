import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/features/my_trips/widgets/my_trip_status/my_expired_trip.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class ArchiveTrips extends StatelessWidget {
  final bool smartLayout;
  final List<StatusedTrip>? trips;
  final ValueSetter<String> onRemoveButtonTap;

  const ArchiveTrips({
    required this.smartLayout,
    required this.trips,
    required this.onRemoveButtonTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (trips == null || trips!.isEmpty) {
      return Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
          Center(
            child: Text(
              'Архив пуст',
              style: context.themeData.textTheme.displayMedium?.copyWith(
                color: context.theme.fivefoldTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.2),
        ],
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.medium),
      child: Column(
        children: <Widget>[
          for (final trip in trips!)
            MyExpiredTrip(
              trip: trip,
              onRemoveButtonTap: onRemoveButtonTap,
            ),
        ].insertBetween(
          const SizedBox(height: AppDimensions.large),
        ),
      ),
    );
  }
}
