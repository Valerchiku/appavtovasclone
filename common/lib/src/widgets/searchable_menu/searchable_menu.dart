import 'dart:async';

import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/searchable_menu/easy_auto_complete.dart';
import 'package:flutter/material.dart';

class SearchableMenu extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController controller;
  final List<String>? items;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final Color? fillColor;

  const SearchableMenu({
    required this.controller,
    required this.items,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.hintText,
    this.fillColor,
    super.key,
  });

  @override
  State<SearchableMenu> createState() => _SearchableMenuState();
}

class _SearchableMenuState extends State<SearchableMenu> {
  Future<List<String>> _fetchSuggestions(String searchValue) async {
    if (widget.items == null) return [];

    return widget.items!
        .where(
          (element) => element.toLowerCase().startsWith(
                searchValue.toLowerCase(),
              ),
        )
        .toList();
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
      asyncSuggestions: _fetchSuggestions,
      cursorColor: colorPath.mainAppColor,
      inputTextStyle: themeStyle,
      suggestionTextStyle: themeStyle,
      onSubmitted: widget.onSubmitted,
      hintText: widget.hintText,
      suggestionBuilder: (data, _, __) {
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
        ),
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
    const bigShimmerWidth = 220.0;
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
