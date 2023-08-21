import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu_suggestion_item.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class SearchableMenu extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final List<String> items;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;

  const SearchableMenu({
    required this.controller,
    required this.items,
    this.onChanged,
    this.onSubmitted,
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

    return EasyAutocomplete(
      focusNode: focusNode,
      controller: controller,
      suggestions: items,
      cursorColor: colorPath.mainAppColor,
      inputTextStyle: themeStyle,
      suggestionTextStyle: themeStyle,
      onSubmitted: onSubmitted,
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
      suggestionBuilder: (data) {
        final splitData = data.split(', ');

        return DropdownMenuItem(
          child: SearchableMenuSuggestionItem(
            name: splitData.first,
            district: splitData.length > 1
                ? splitData[1]
                : null,
            region: splitData.length > 2 ? splitData[2] : null,
          ),
        );
      },
      onChanged: onChanged,
    );
  }
}
