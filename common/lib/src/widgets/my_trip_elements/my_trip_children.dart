import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:flutter/material.dart';

class MyTripChildren extends StatelessWidget {
  final List<Widget> children;
  const MyTripChildren({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.insertBetween(
        const SizedBox(
          height: CommonDimensions.medium,
        ),
      ),
    );
  }
}
