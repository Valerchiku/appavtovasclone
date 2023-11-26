import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BottomSheetList extends StatelessWidget {
  final String orderNumber;
  final List<PageOptionTile> children;

  const BottomSheetList({
    required this.orderNumber,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}
