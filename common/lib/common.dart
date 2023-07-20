import 'package:flutter/material.dart';
/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// for same call in different features
class Utils {
  /// show date picker in autovas style
  static showAutovasDatePicker({required BuildContext context}) {
    showDatePicker(
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      primary: Colors.green, // header background color
                      onPrimary: Colors.greenAccent, // header text color
                      onSurface: Colors.green // body text color
                  ),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.green, // button text color
                      )
                  )
              ),
              child: child!
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
            Duration(
                days: 180
            )
        )
    );
  }
}