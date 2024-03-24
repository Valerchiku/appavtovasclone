import 'package:common/src/widgets/utils_widgets/selectable_overlay.dart';
import 'package:core/domain/entities/single_trip/single_trip_fares.dart';
import 'package:flutter/material.dart';

final class PassengerRateSheet extends StatelessWidget {
  final List<SingleTripFares> singleTripFares;
  final ValueChanged<String> onRateChanged;
  final String selectedRate;

  const PassengerRateSheet({
    required this.singleTripFares,
    required this.onRateChanged,
    required this.selectedRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableOverlay<String>(
      items: [
        for (final fare in singleTripFares)
          SelectableOverlayItem(
            onItemChanged: onRateChanged,
            itemLabel: fare.name,
            item: fare.name,
            selectedItem: selectedRate,
          ),
      ],
    );
  }
}
