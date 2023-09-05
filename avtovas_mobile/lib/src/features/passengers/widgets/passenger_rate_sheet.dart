import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerRateSheet extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengerRateSheet({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengerRateSheet> createState() => _PassengerRateSheetState();
}

class _PassengerRateSheetState extends State<PassengerRateSheet> {
  late final SheetController _sheetController;

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
  }

  void _onRateUpdate(String value) {
    widget.cubit
      ..changeCurrentPassenger(rate: value)
      ..closeBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasBottomSheet(
          controller: _sheetController,
          onClose: ([_]) {
            widget.cubit.closeBottomSheet();
          },
          backgroundColor: context.theme.containerBackgroundColor,
          contentBuilder: (_, __) {
            return Column(
              children: [
                _RateItem(
                  onRateChanged: _onRateUpdate,
                  rate: context.locale.adult,
                  selectedRate: state.currentPassenger.rate,
                ),
                _RateItem(
                  onRateChanged: _onRateUpdate,
                  rate: context.locale.childish,
                  selectedRate: state.currentPassenger.rate,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

final class _RateItem extends StatelessWidget {
  final ValueChanged<String> onRateChanged;
  final String rate;
  final String selectedRate;

  const _RateItem({
    required this.onRateChanged,
    required this.rate,
    required this.selectedRate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.medium),
      child: Material(
        color: context.theme.transparent,
        child: InkWell(
          onTap: () => onRateChanged(rate),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.large),
            child: Row(
              children: [
                Text(
                  rate,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.sizeHeadlineMedium,
                  ),
                ),
                const Spacer(),
                AvtovasCheckbox(
                  onChanged: (_) => onRateChanged(rate),
                  value: rate == selectedRate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
