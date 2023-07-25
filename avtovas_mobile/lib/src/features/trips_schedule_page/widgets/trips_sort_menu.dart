import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
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

  @override
  Widget build(BuildContext context) {
    String sortTrips(BuildContext context, SortOptions sortOption) {
      switch (sortOption) {
        case SortOptions.byPrice:
          return context.locale.sortByPrice;
        case SortOptions.byTime:
          return context.locale.sortByTime;
      }
    }

    return SelectableMenu(
      currentValue: sortTrips(
        context,
        selectedOption,
      ),
      svgAssetPath: AppAssets.downArrowIcon,
      backgroundColor: context.theme.detailsBackgroundColor,
      menuItems: [
        SelectableMenuItem(
          currentValue: sortTrips(
            context,
            selectedOption,
          ),
          itemValue: sortTrips(
            context,
            SortOptions.byTime,
          ),
          onTap: () {
            tripsScheduleCubit.updateFilter(SortOptions.byTime);
            Navigator.of(context).pop();
          },
        ),
        SelectableMenuItem(
          currentValue: sortTrips(
            context,
            selectedOption,
          ),
          itemValue: sortTrips(
            context,
            SortOptions.byPrice,
          ),
          onTap: () {
            tripsScheduleCubit.updateFilter(SortOptions.byPrice);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
