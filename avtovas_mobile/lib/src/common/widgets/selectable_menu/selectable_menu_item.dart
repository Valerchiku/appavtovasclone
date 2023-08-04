import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/material.dart';

class SelectableMenuItem extends StatelessWidget {
  final String itemLabel;
  final SortOptions currentValue;
  final SortOptions itemValue;

  final VoidCallback onTap;
  const SelectableMenuItem({
    required this.itemLabel,
    required this.currentValue,
    required this.itemValue,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding: EdgeInsets.zero,
        title: Text(itemLabel),
        trailing: Radio(
          value: itemValue,
          groupValue: currentValue,
          onChanged: (value) {}, // Вместо onChanged используем InkWell
          activeColor: context.theme.mainAppColor,
        ),
      ),
    );
  }
}
