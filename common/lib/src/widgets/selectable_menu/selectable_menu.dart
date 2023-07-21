// ignore_for_file: public_member_api_docs, prefer_const_constructors, lines_longer_than_80_chars, comment_references, unnecessary_string_interpolations
// ignore_for_file: always_put_required_named_parameters_first

import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

class SelectableMenu extends StatelessWidget {
  final String? dropdownValue;
  final List<String> items;

  /// By default, the value of {hint} should be [Widget], but currently it is [null]. To enable the hint, set {showHint} to [true], and provide a [Widget] for the {hint} parameter.
  final Widget? hint;

  /// By default, the value of {radius} is [4.0].
  final double radius;

  /// By default, the value of {showIcon} is [true]. If you want to disable the icon, please set it to [false]
  final bool showIcon;

  /// By default, the value of {showHint} is [false]. If you want to enable the hint, please set it to [true]
  final bool showHint;

  /// By default, the value of {isCustomBackgroundColor} is [false]. If you want to change the background color of the {dropdown button}, please set it to [true] and then specify the color in the {backgroundColor} parameter.
  final bool isCustomBackgroundColor;

  /// By default, the value of {isCustomDropdown} is [false]. If you want to change the background color of the {dropdown menu}, please set it to [true] and then specify the color in the {dropdownBackgroundColor} parameter.
  final bool isCustomDropdown;

  /// Background color for the {dropdown button}, not for the {dropdown menu}! To enable the custom background color, set {isCustomBackgroundColor} to [true].
  final Color? backgroundColor;

  /// Background color for the {dropdown menu}. To enable the custom background color, set {isCustomDropdown} to [true].
  final Color? dropdownBackgroundColor;

  final ValueChanged<String?>? onChanged;
  final ValueChanged<Object?>? onChangedRadio;
  const SelectableMenu({
    required this.dropdownValue,
    required this.items,
    this.hint,
    this.radius = CommonDimensions.small,
    this.showIcon = true,
    this.showHint = false,
    this.isCustomBackgroundColor = false,
    this.isCustomDropdown = false,
    this.backgroundColor,
    this.dropdownBackgroundColor,
    required this.onChanged,
    required this.onChangedRadio,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    return Container(
      decoration: BoxDecoration(
        color: !isCustomBackgroundColor
            ? colorPath.detailsBackgroundColor
            : backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(
          color: AvtovasPlatform.isWeb
              ? colorPath.assistiveTextColor
              : colorPath.detailsBackgroundColor,
        ),
      ),
      child: DropdownButton(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
        ),
        value: dropdownValue,
        hint: showHint ? hint : null,
        items: items
            .map<DropdownMenuItem<String>>(
              (String menuValue) => DropdownMenuItem<String>(
                value: menuValue,
                child: Text('$menuValue'),
              ),
            )
            .toList(),
        dropdownColor: !isCustomDropdown
            ? colorPath.detailsBackgroundColor
            : dropdownBackgroundColor,
        icon: showIcon ? null : Container(),
        underline: Container(),
        onChanged: onChanged,
        isExpanded: true,
      ),
    );
  }
}
