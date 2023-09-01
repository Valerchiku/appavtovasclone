import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/sheet_types.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerDatePickerSheet extends StatefulWidget {
  final PassengersCubit cubit;
  final SheetController sheetController;

  const PassengerDatePickerSheet({
    required this.cubit,
    required this.sheetController,
    super.key,
  });

  @override
  State<PassengerDatePickerSheet> createState() =>
      _PassengerDatePickerSheetState();
}

class _PassengerDatePickerSheetState extends State<PassengerDatePickerSheet> {
  @override
  Widget build(BuildContext context) {
    return AvtovasBottomSheet(
      controller: widget.sheetController,
      onClose: ([_]) {
        widget.cubit.changeSheetType(PassengerSheetTypes.passenger);
      },
      backgroundColor: context.theme.containerBackgroundColor,
      contentBuilder: (_, __) {
        final now = DateTime.now();

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
            vertical: AppDimensions.medium,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: CupertinoDatePicker(
                  initialDateTime: now.leaveDateOnly(),
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: now.leaveDateOnly(),
                  minimumDate:
                      now.copyWith(year: now.year - 120).leaveDateOnly(),
                  onDateTimeChanged: (value) =>
                      widget.cubit.changeCurrentPassenger(
                    birthdayDate: value,
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.medium),
              Row(
                children: [
                  const Spacer(),
                  AvtovasButton.text(
                    buttonText: 'Готово',
                    onTap: () {
                      widget.cubit
                          .changeSheetType(PassengerSheetTypes.passenger);
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.medium),
            ],
          ),
        );
      },
    );
  }
}
