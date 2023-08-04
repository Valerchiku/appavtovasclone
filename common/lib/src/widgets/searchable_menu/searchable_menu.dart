import 'package:common/avtovas_common.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

class SearchableMenu extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final List<String> items;
  final ValueChanged onChanged;
  final String? hintText;

  const SearchableMenu({
    required this.controller,
    required this.items,
    required this.onChanged,
    this.focusNode,
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

    return GestureDetector(
      child: EasyAutocomplete(
        focusNode: focusNode,
        controller: controller,
        suggestions: items,
        cursorColor: colorPath.mainAppColor,
        inputTextStyle: themeStyle,
        suggestionTextStyle: themeStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
            vertical: CommonDimensions.medium,
          ),
          filled: true,
          fillColor: colorPath.containerBackgroundColor,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPath.containerBackgroundColor,
            ),
          ),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorPath.containerBackgroundColor,
            ),
          ),
        ),
        suggestionBuilder: (data) => DropdownMenuItem(
          child: Text(data),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
