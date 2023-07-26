import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripsSortMenu extends StatelessWidget {
  final TripsScheduleCubit tripsScheduleCubit;
  final SortOptions selectedOption;
  const TripsSortMenu({
    required this.tripsScheduleCubit,
    required this.selectedOption,
    super.key,
  });

  String _getSortOptionLabel(BuildContext context, SortOptions sortOption) =>
      sortOption == SortOptions.byPrice
          ? context.locale.sortByPrice
          : context.locale.sortByTime;

  @override
  Widget build(BuildContext context) {
    return SelectableMenu(
      currentLabel: _getSortOptionLabel(
        context,
        selectedOption,
      ),
      svgAssetPath: AppAssets.downArrowIcon,
      backgroundColor: context.theme.detailsBackgroundColor,
      menuItems: [
        SelectableMenuItem(
          itemLabel: _getSortOptionLabel(
            context,
            SortOptions.byTime,
          ),
          currentValue: selectedOption,
          itemValue: SortOptions.byTime,
          onTap: () {
            tripsScheduleCubit.updateFilter(SortOptions.byTime);
            Navigator.of(context).pop();
          },
        ),
        SelectableMenuItem(
          itemLabel: _getSortOptionLabel(
            context,
            SortOptions.byPrice,
          ),
          currentValue: selectedOption,
          itemValue: SortOptions.byPrice,
          onTap: () {
            tripsScheduleCubit.updateFilter(SortOptions.byPrice);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
