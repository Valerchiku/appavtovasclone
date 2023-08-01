import 'package:common/avtovas_common.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

class SearchableMenu extends StatelessWidget {
  final TextEditingController controller;
  final List<String> items;
  final ValueChanged onChanged;
  final String? hintText;
  const SearchableMenu({
    required this.controller,
    required this.items,
    required this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themeStyle = context.themeData.textTheme.headlineMedium!.copyWith(
      fontWeight: CommonFonts.weightRegular,
      color: colorPath.secondaryTextColor,
    );

    return EasyAutocomplete(
      controller: controller,
      suggestions: items,
      cursorColor: colorPath.mainAppColor,
      inputTextStyle: themeStyle,
      suggestionTextStyle: themeStyle,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(CommonDimensions.large),
        filled: true,
        fillColor: colorPath.whitespaceContainerColor,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPath.whitespaceContainerColor,
          ),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorPath.whitespaceContainerColor,
          ),
        ),
      ),
      suggestionBuilder: (data) => DropdownMenuItem(
        child: Text(data),
      ),
      onChanged: onChanged,
    );
  }
}
