import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unreachable_switch_case

class TripsSortMenu extends StatelessWidget {
  final SortOptions selectedOption;
  final VoidCallback onTimeSortSelected;
  final VoidCallback onPriceSortSelected;
  const TripsSortMenu({
    required this.selectedOption,
    required this.onTimeSortSelected,
    required this.onPriceSortSelected,
    super.key,
  });

  String _getSortOptionLabel(BuildContext context, SortOptions sortOption) =>
      switch (sortOption) {
        SortOptions.byPrice => context.locale.sortByPrice,
        SortOptions.byTime => context.locale.sortByTime,
        _ => context.locale.sortByTime,
      };

  @override
  Widget build(BuildContext context) {
    return SelectableMenu(
      currentLabel: _getSortOptionLabel(context, selectedOption),
      svgAssetPath: AppAssets.downArrowIcon,
      backgroundColor: context.theme.detailsBackgroundColor,
      menuItems: [
        SelectableMenuItem(
          itemLabel: _getSortOptionLabel(context, SortOptions.byTime),
          currentValue: selectedOption,
          itemValue: SortOptions.byTime,
          onTap: onTimeSortSelected,
        ),
        SelectableMenuItem(
          itemLabel: _getSortOptionLabel(context, SortOptions.byPrice),
          currentValue: selectedOption,
          itemValue: SortOptions.byPrice,
          onTap: onPriceSortSelected,
        ),
      ],
    );
  }
}
