import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/common_colors.dart';
/// for same call date picker in different features
class AvtovasDatepickerUtils {

  static final int daysRange = 180;
  static final DateTime now = DateTime.now();

  /// show date picker in autovas style
  static showAutovasDatePicker({required BuildContext context}) {
    showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      primary: CommonColors.headerBackgroundColor,
                      onPrimary: CommonColors.headerTextColor,
                      onSurface: CommonColors.bodyTextColor
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: CommonColors.btnTextColor
                      )
                  )
              ),
              child: child!
          );
        },
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: now.add(
            Duration(
                days: daysRange
            )
        )
    );
  }
}