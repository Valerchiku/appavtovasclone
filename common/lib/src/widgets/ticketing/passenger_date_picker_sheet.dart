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
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.medium,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
              child: CupertinoDatePicker(
                initialDateTime: initialDate.isAfter(now)
                    ? now.leaveDateOnly()
                    : initialDate,
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
