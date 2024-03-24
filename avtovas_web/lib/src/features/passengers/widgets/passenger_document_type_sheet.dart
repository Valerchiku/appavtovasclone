
import 'package:common/avtovas_ticketing.dart';
import 'package:common/avtovas_utils_widgets.dart';
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
    final documents = DocumentTypes.documentTypes(context);
    return SelectableOverlay<String>(
      needScroll: true,
      items: [
        for (final document in documents)
          SelectableOverlayItem(
            onItemChanged: onDocumentTypeChanged,
            itemLabel: document,
            item: document,
            selectedItem: selectedDocumentType,
          ),
      ],
    );
  }
}
