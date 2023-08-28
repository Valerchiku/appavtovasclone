import 'package:common/avtovas_common.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';

class SearchableMenu extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final List<String>? items;
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
  State<SearchableMenu> createState() => _SearchableMenuState();
}

class _SearchableMenuState extends State<SearchableMenu> {
  Future<List<String>> fetchSuggestions(String searchValue) async {
    if (widget.items != null) {
      final filteredSuggestions = widget.items!.where((element) {
        return element.toLowerCase().startsWith(searchValue.toLowerCase());
      }).toList();
      return filteredSuggestions;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final colorPath = context.theme;
    final themeStyle = context.themeData.textTheme.headlineMedium!.copyWith(
      fontWeight: CommonFonts.weightRegular,
      color: colorPath.secondaryTextColor,
    );

    return EasyAutocomplete(
      focusNode: widget.focusNode,
      controller: widget.controller,
      asyncSuggestions: fetchSuggestions,
      // suggestions: items,
      cursorColor: colorPath.mainAppColor,
      inputTextStyle: themeStyle,
      suggestionTextStyle: themeStyle,
      onSubmitted: widget.onSubmitted,
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
        hintText: widget.hintText,
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
            district: splitData.length > 1 ? splitData[1] : null,
            region: splitData.length > 2 ? splitData[2] : null,
          ),
        );
      },
      onChanged: widget.onChanged,
      progressIndicatorBuilder: const _ProgressIndicatorBuilder(),
    );
  }
}

class _ProgressIndicatorBuilder extends StatelessWidget {
  const _ProgressIndicatorBuilder();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProgressIndicatorBuilderShimmerItem(),
            SizedBox(height: CommonDimensions.large),
            _ProgressIndicatorBuilderShimmerItem(),
            SizedBox(height: CommonDimensions.large),
            _ProgressIndicatorBuilderShimmerItem(),
          ],
        )
      ],
    );
  }
}

class _ProgressIndicatorBuilderShimmerItem extends StatelessWidget {
  const _ProgressIndicatorBuilderShimmerItem();

  @override
  Widget build(BuildContext context) {
    const smallShimmerHeight = 14.0;
    const bigShimmerHeight = 12.0;
    const smallShimmerWidth = 160.0;
    const bigShimmerWidth = 260.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseShimmer(
          margin:
              const EdgeInsets.symmetric(horizontal: CommonDimensions.medium),
          baseColor: context.theme.darkShimmerColor,
          radius: CommonDimensions.extraSmall,
          shimmerHeight: smallShimmerHeight,
          shimmerWidth: smallShimmerWidth,
        ),
        const SizedBox(
          height: CommonDimensions.medium,
        ),
        const BaseShimmer(
          margin: EdgeInsets.symmetric(horizontal: CommonDimensions.medium),
          radius: CommonDimensions.extraSmall,
          shimmerHeight: bigShimmerHeight,
          shimmerWidth: bigShimmerWidth,
        ),
      ],
    );
  }
}
