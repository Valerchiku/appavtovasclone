import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/sheet_types.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerDocumentSheet extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengerDocumentSheet({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengerDocumentSheet> createState() => _PassengerDocumentSheetState();
}

class _PassengerDocumentSheetState extends State<PassengerDocumentSheet> {
  late final SheetController _sheetController;

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PassengersCubit, PassengersState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return AvtovasBottomSheet(
          controller: _sheetController,
          onClose: ([_]) {
            widget.cubit.changeSheetType(PassengerSheetTypes.passenger);
          },
          backgroundColor: context.theme.containerBackgroundColor,
          contentBuilder: (_, __) {
            return Column(
              children: [
                _DocumentItem(
                  onTypeChanged: (value) {
                    widget.cubit
                      ..changeCurrentPassenger(documentType: value)
                      ..changeSheetType(PassengerSheetTypes.passenger);
                  },
                  type: 'Паспорт РФ',
                  selectedType: state.currentPassenger.documentType,
                ),
                _DocumentItem(
                  onTypeChanged: (value) {
                    widget.cubit
                      ..changeCurrentPassenger(documentType: value)
                      ..changeSheetType(PassengerSheetTypes.passenger);
                  },
                  type: 'Не резидент РФ',
                  selectedType: state.currentPassenger.documentType,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

final class _DocumentItem extends StatelessWidget {
  final ValueChanged<String> onTypeChanged;
  final String type;
  final String selectedType;

  const _DocumentItem({
    required this.onTypeChanged,
    required this.type,
    required this.selectedType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.medium),
      child: Material(
        color: context.theme.transparent,
        child: InkWell(
          onTap: () => onTypeChanged(type),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDimensions.medium),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.large),
            child: Row(
              children: [
                Text(
                  type,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.sizeHeadlineMedium,
                  ),
                ),
                const Spacer(),
                AvtovasCheckbox(
                  onChanged: (_) => onTypeChanged(type),
                  value: type == selectedType,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
