import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/date_time_extension.dart';
import 'package:common/src/widgets/avtovas_buttons/avtovas_button.dart';
import 'package:flutter/cupertino.dart';

final class PassengerDatePickerSheet extends StatelessWidget {
  final ValueChanged<DateTime> onBirthdayDateChanged;
  final DateTime initialDate;

  const PassengerDatePickerSheet({
    required this.onBirthdayDateChanged,
    required this.initialDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return ClipRRect(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.medium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.parse('2000-01-01'),
                mode: CupertinoDatePickerMode.date,
                maximumDate: now.leaveDateOnly(),
                minimumDate: now.copyWith(year: now.year - 120).leaveDateOnly(),
                onDateTimeChanged: onBirthdayDateChanged,
              ),
            ),
            const SizedBox(height: CommonDimensions.medium),
            Row(
              children: [
                const Spacer(),
                AvtovasButton.text(
                  buttonText: 'Готово',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: CommonDimensions.medium),
          ],
        ),
      ),
    );
  }
}
