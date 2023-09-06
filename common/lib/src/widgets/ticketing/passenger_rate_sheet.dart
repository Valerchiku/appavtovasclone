import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/selectable_bottom_sheet/selectable_overlay.dart';
import 'package:flutter/material.dart';

final class PassengerRateSheet extends StatelessWidget {
  final ValueChanged<String> onRateChanged;
  final String selectedRate;

  const PassengerRateSheet({
    required this.onRateChanged,
    required this.selectedRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableOverlay<String>(
      items: [
        SelectableOverlayItem(
          onItemChanged: onRateChanged,
          itemLabel: context.locale.adult,
          item: context.locale.adult,
          selectedItem: selectedRate,
        ),
        SelectableOverlayItem(
          onItemChanged: onRateChanged,
          itemLabel: context.locale.childish,
          item: context.locale.childish,
          selectedItem: selectedRate,
        ),
      ],
    );
  }
}
