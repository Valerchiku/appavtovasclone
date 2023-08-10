import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/utils/sort_options.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/cubit/trips_schedule_cubit.dart';
import 'package:avtovas_mobile/src/features/trips_schedule_page/widgets/trips_sort_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortOptionsSelector extends StatelessWidget {
  final SortOptions selectedOption;
  final ValueChanged<SortOptions> onSortOptionChanged;

  const SortOptionsSelector({
    required this.selectedOption,
    required this.onSortOptionChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TripsSortMenu(
      selectedOption: selectedOption,
      onSortOptionChanged: (option) {
        onSortOptionChanged(option);
        Navigator.of(context).pop();
      },
    );
  }
}
