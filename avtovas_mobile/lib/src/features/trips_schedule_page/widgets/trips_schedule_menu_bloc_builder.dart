import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_sort_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsScheduleMenuBlocBuilder extends StatelessWidget {
  const TripsScheduleMenuBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsScheduleCubit, TripsScheduleState>(
      builder: (context, state) {
        final tripsScheduleCubit = CubitScope.of<TripsScheduleCubit>(context);
        return TripsSortMenu(
          selectedOption: state.selectedOption,
          onTimeSortSelected: () {
            tripsScheduleCubit.updateFilter(SortOptions.byTime);
            Navigator.of(context).pop();
          },
          onPriceSortSelected: () {
            tripsScheduleCubit.updateFilter(SortOptions.byPrice);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
