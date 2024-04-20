import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class SelectableMenuItem<T> extends StatelessWidget {
  final String itemLabel;
  final T currentValue;
  final T itemValue;

  final VoidCallback onTap;
  final ValueChanged<T?>? onChanged;

  const SelectableMenuItem({
    required this.itemLabel,
    required this.currentValue,
    required this.itemValue,
    required this.onTap,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
        Navigator.of(context).pop();
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
      ),
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.medium,
      ),
      title: Text(
        itemLabel,
        style: context.themeData.textTheme.headlineMedium?.copyWith(
          fontWeight: AppFonts.weightRegular,
        ),
      ),
      trailing: IgnorePointer(
        child: Radio(
          fillColor: MaterialStateProperty.resolveWith<Color>(
            (_) => currentValue == itemValue
                ? context.theme.mainAppColor
                : context.theme.quaternaryTextColor,
          ),
          value: itemValue,
          groupValue: currentValue,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
