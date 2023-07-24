import 'package:common/src/utils/constants/common_colors.dart';
import 'package:flutter/material.dart';
/// for same call date picker in different features
class AvtovasDatepickerUtils {

  static const int daysRange = 180;

  /// show date picker in autovas style
  static void showAutovasDatePicker({required BuildContext context}) {
    showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                      primary: CommonColors.headerBackgroundColor,
                      onPrimary: CommonColors.headerTextColor,
                      onSurface: CommonColors.bodyTextColor
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: CommonColors.btnTextColor
                      ),
                  ),
              ),
              child: child!
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
            Duration(
                days: daysRange
            ),
        ),
    );
  }
}
