import 'package:common/src/widgets/utils_widgets/selectable_overlay.dart';
import 'package:flutter/material.dart';

final class PassengerDocumentTypeSheet extends StatelessWidget {
  final ValueChanged<String> onDocumentTypeChanged;
  final String selectedDocumentType;

  const PassengerDocumentTypeSheet({
    required this.onDocumentTypeChanged,
    required this.selectedDocumentType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableOverlay<String>(
      items: [
        SelectableOverlayItem(
          onItemChanged: onDocumentTypeChanged,
          itemLabel: 'Паспорт РФ',
          item: 'Паспорт РФ',
          selectedItem: selectedDocumentType,
        ),
        SelectableOverlayItem(
          onItemChanged: onDocumentTypeChanged,
          itemLabel: 'Не резидент РФ',
          item: 'Не резидент РФ',
          selectedItem: selectedDocumentType,
        ),
      ],
    );
  }
}
