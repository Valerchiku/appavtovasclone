import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

final class TripStatusSelectorButton extends StatelessWidget {
  final ValueChanged<UserTripStatus> onTripsStatusChanged;
  final UserTripStatus selectorStatus;
  final UserTripStatus selectedStatus;
  final String text;

  const TripStatusSelectorButton({
    required this.onTripsStatusChanged,
    required this.selectorStatus,
    required this.selectedStatus,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: AvtovasButton.text(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.large,
          vertical: AppDimensions.large,
        ),
        buttonColor: selectorStatus == selectedStatus
            ? context.theme.dividerColor
            : context.theme.whiteTextColor,
        textStyle: context.themeData.textTheme.bodyLarge,
        borderColor: context.theme.mainAppColor,
        buttonText: text,
        onTap: () => onTripsStatusChanged(selectorStatus),
      ),
    );
  }
}
