import 'package:avtovas_mobile/src/common/widgets/selectable_bottom_sheet/selectable_overlay.dart';
import 'package:common/avtovas_common.dart';
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
