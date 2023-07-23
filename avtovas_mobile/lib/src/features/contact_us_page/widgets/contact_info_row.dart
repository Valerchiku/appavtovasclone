import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class ContactInfoRow extends StatelessWidget {
  final Widget icon;
  final String label;

  const ContactInfoRow({
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: CommonDimensions.large),
        Text(
          label,
          style: context.themeData.textTheme.titleLarge,
        ),
      ],
    );
  }
}
