import 'package:common/src/widgets/utils_widgets/selectable_overlay.dart';
import 'package:flutter/material.dart';

final class PassengerSeatsSheet extends StatelessWidget {
  final List<String> availableSeats;
  final ValueChanged<String> onSeatChanged;
  final String selectedSeat;

  const PassengerSeatsSheet({
    required this.availableSeats,
    required this.onSeatChanged,
    required this.selectedSeat,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableOverlay<String>(
      items: [
        for (final seat in availableSeats)
          SelectableOverlayItem(
            onItemChanged: onSeatChanged,
            itemLabel: seat,
            item: seat,
            selectedItem: selectedSeat,
          ),
      ],
    );
  }
}
