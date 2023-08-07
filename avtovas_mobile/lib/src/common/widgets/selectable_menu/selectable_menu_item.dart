import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/material.dart';

class SelectableMenuItem<T> extends StatelessWidget {
  final String itemLabel;
  final T currentValue;
  final T itemValue;

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
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.medium),
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
        ),
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.medium,
        ),
        title: Text(itemLabel),
        trailing: Radio(
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (_) => currentValue == itemValue
                ? context.theme.mainAppColor
                : context.theme.quaternaryTextColor,
          ),
          value: itemValue,
          groupValue: currentValue,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
