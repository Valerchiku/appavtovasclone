
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
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
          horizontal: AppDimensions.large,
          vertical: AppDimensions.medium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.parse('2000-01-01'),
                mode: CupertinoDatePickerMode.date,
                maximumDate: now.leaveDateOnly(),
                minimumDate: now.copyWith(year: now.year - 120).leaveDateOnly(),
                onDateTimeChanged: onBirthdayDateChanged,
              ),
            ),
            const SizedBox(height: AppDimensions.medium),
            Row(
              children: [
                const Spacer(),
                AvtovasButton.text(
                  buttonText: 'Готово',
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.medium),
          ],
        ),
      ),
    );
  }
}
