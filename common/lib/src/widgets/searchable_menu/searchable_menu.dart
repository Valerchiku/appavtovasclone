import 'package:common/avtovas_common.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:field_suggestion/field_suggestion.dart';
import 'package:flutter/material.dart';

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
      suggestionBuilder: (data) => DropdownMenuItem(
        child: Text(data),
      ),
      onChanged: onChanged,
    );
  }
}

final class SuggestionField extends StatelessWidget {
  final TextEditingController controller;
  final List<Widget> suggestions;
  final bool Function(Widget, String) onSearch;
  final String hintText;

  const SuggestionField({
    required this.controller,
    required this.suggestions,
    required this.onSearch,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themeStyle = context.themeData.textTheme.headlineMedium!.copyWith(
      fontWeight: CommonFonts.weightRegular,
      color: colorPath.secondaryTextColor,
    );

    return FieldSuggestion(
      itemBuilder: (_, index) => suggestions[index],
      textController: controller,
      suggestions: suggestions,
      search: onSearch,
      inputDecoration: InputDecoration(
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
    );
  }
}
