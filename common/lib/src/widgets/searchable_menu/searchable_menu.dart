import 'package:common/avtovas_common.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
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

class TestSearchableMenu<T> extends StatelessWidget {
  final List<SearchFieldListItem<T>> suggestions;
  final TextEditingController textEditingController;
  final String hintText;
  final ValueChanged<SearchFieldListItem<T>> onChanged;
  final InputDecoration? inputDecoration;

  const TestSearchableMenu({
    required this.suggestions,
    required this.textEditingController,
    required this.hintText,
    required this.onChanged,
    this.inputDecoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themePath = context.themeData.textTheme;
    return SearchField(
      controller: textEditingController,
      itemHeight: 50,
      searchInputDecoration: inputDecoration ??
          InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: CommonDimensions.medium,
              horizontal: CommonDimensions.large,
            ),
            filled: true,
            fillColor: colorPath.containerBackgroundColor,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: AvtovasPlatform.isWeb
                  ? BorderSide(color: colorPath.assistiveTextColor)
                  : BorderSide(color: colorPath.containerBackgroundColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: AvtovasPlatform.isWeb
                  ? BorderSide(color: colorPath.assistiveTextColor)
                  : BorderSide(color: colorPath.containerBackgroundColor),
            ),
            hintText: hintText,
            hintStyle: themePath.titleLarge?.copyWith(
              color: context.theme.assistiveTextColor,
              height: CommonFonts.sizeFactorLarge,
            ),
          ),
      onSuggestionTap: onChanged,
      suggestions: suggestions,
    );
  }
}
