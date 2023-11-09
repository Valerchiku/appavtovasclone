import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/utils/enums/sort_options.dart';
import 'package:avtovas_web/src/common/widgets/selectable_menu/selectable_menu.dart';
import 'package:avtovas_web/src/common/widgets/selectable_menu/selectable_menu_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/avtovas_utils_widgets.dart';
import 'package:flutter/material.dart';

// ignore_for_file: unreachable_switch_case

class TripsSortMenu extends StatelessWidget {
  final SortOptions selectedOption;
  final ValueChanged<SortOptions> onSortOptionChanged;

  const TripsSortMenu({
    required this.selectedOption,
    required this.onSortOptionChanged,
    super.key,
  });

  Future<void> _showSortSelector(BuildContext context) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: context.theme.whiteTextColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SelectorButton(
                onOptionSelected: onSortOptionChanged,
                option: SortOptions.byTime,
                currentOption: selectedOption,
                text: _getSortOptionLabel(context, SortOptions.byTime),
              ),
              const SizedBox(height: AppDimensions.medium),
              _SelectorButton(
                onOptionSelected: onSortOptionChanged,
                option: SortOptions.byPrice,
                currentOption: selectedOption,
                text: _getSortOptionLabel(context, SortOptions.byPrice),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getSortOptionLabel(BuildContext context, SortOptions sortOption) =>
      switch (sortOption) {
        SortOptions.byPrice => context.locale.sortByPrice,
        SortOptions.byTime => context.locale.sortByTime,
        _ => context.locale.sortByTime,
      };

  @override
  Widget build(BuildContext context) {
    return AvtovasButton.text(
      buttonText: _getSortOptionLabel(context, selectedOption),
      textStyle: context.themeData.textTheme.bodyLarge,
      buttonColor: context.theme.whiteTextColor,
      onTap: () => _showSortSelector(context),
    );
  }
}

final class _SelectorButton extends StatelessWidget {
  final ValueSetter<SortOptions> onOptionSelected;
  final SortOptions option;
  final String text;
  final SortOptions currentOption;

  const _SelectorButton({
    required this.onOptionSelected,
    required this.option,
    required this.currentOption,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onOptionSelected(option);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Row(
          children: [
            Text(
              text,
              style: context.themeData.textTheme.bodyLarge,
            ),
            const Spacer(),
            Radio(
              value: option,
              groupValue: currentOption,
              onChanged: (value) {
                onOptionSelected(value!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
