import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu.dart';
import 'package:avtovas_mobile/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsSortMenu extends StatelessWidget {
  const TripsSortMenu({super.key});

  String _getSortOptionLabel(BuildContext context, SortOptions sortOption) =>
      sortOption == SortOptions.byPrice
          ? context.locale.sortByPrice
          : context.locale.sortByTime;

  @override
  Widget build(BuildContext context) {
    final tripsScheduleCubit = CubitScope.of<TripsScheduleCubit>(context);
    return BlocBuilder<TripsScheduleCubit, TripsScheduleState>(
      builder: (context, state) {
        return SelectableMenu(
          currentLabel: _getSortOptionLabel(
            context,
            state.selectedOption,
          ),
          svgAssetPath: AppAssets.downArrowIcon,
          backgroundColor: context.theme.detailsBackgroundColor,
          menuItems: [
            SelectableMenuItem(
              itemLabel: _getSortOptionLabel(
                context,
                SortOptions.byTime,
              ),
              currentValue: state.selectedOption,
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
              currentValue: state.selectedOption,
              itemValue: SortOptions.byPrice,
              onTap: () {
                tripsScheduleCubit.updateFilter(SortOptions.byPrice);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
