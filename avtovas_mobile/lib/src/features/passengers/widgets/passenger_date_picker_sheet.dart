import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_bottom_sheet/avtovas_bottom_sheet.dart';
import 'package:avtovas_mobile/src/features/passengers/cubit/passengers_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

final class PassengerDatePickerSheet extends StatefulWidget {
  final PassengersCubit cubit;

  const PassengerDatePickerSheet({
    required this.cubit,
    super.key,
  });

  @override
  State<PassengerDatePickerSheet> createState() =>
      _PassengerDatePickerSheetState();
}

class _PassengerDatePickerSheetState extends State<PassengerDatePickerSheet> {
  late final SheetController _sheetController;

  @override
  void initState() {
    super.initState();

    _sheetController = SheetController();
  }

  @override
  Widget build(BuildContext context) {
    return AvtovasBottomSheet(
      controller: _sheetController,
      onClose: ([_]) {
        widget.cubit.closeBottomSheet();
      },
      backgroundColor: context.theme.containerBackgroundColor,
      contentBuilder: (_, __) {
        final now = DateTime.now();
        final passengerBirthday =
            widget.cubit.state.currentPassenger.birthdayDate;

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
                  initialDateTime: passengerBirthday.isAfter(now)
                      ? now.leaveDateOnly()
                      : passengerBirthday,
                  mode: CupertinoDatePickerMode.date,
                  maximumDate: now.leaveDateOnly(),
                  minimumDate:
                      now.copyWith(year: now.year - 120).leaveDateOnly(),
                  onDateTimeChanged: (value) => widget.cubit
                    ..changeCurrentPassenger(
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
                      widget.cubit.closeBottomSheet();
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
