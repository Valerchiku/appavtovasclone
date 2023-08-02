import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

final class AvtovasCheckbox extends StatelessWidget {
  final ValueChanged<bool?> onChanged;
  final bool value;
  final String checkboxText;
  final TextStyle? textStyle;

  const AvtovasCheckbox({
    required this.onChanged,
    required this.value,
    required this.checkboxText,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: CommonDimensions.medium),
        Text(checkboxText, style: textStyle),
      ],
    );
  }
}
