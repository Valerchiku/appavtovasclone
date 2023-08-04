import 'package:flutter/material.dart';

class SelectableMenuItem extends StatelessWidget {
  final String currentValue;
  final String itemValue;
  final VoidCallback onTap;
  const SelectableMenuItem({
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
        title: Text(itemValue),
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
