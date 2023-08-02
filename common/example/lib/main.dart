// ignore_for_file: depend_on_referenced_packages

import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppExample());
}

final class AppExample extends StatefulWidget {
  const AppExample({super.key});

  @override
  State<AppExample> createState() => _AppExampleState();
}

class _AppExampleState extends State<AppExample> {
  var _currentGender = Genders.male;
  var _surnameVisible = true;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      theme: lightTheme,
      themeData: generateThemeData(lightTheme),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            localizationsDelegates: AvtovasLocalization.localizationsDelegates,
            supportedLocales: AvtovasLocalization.supportedLocales,
            home: Material(
              child: ListView(
                children: [
                  PassengerCollapsedContainer(
                    onGenderChanged: (gender) =>
                        setState(() => _currentGender = gender),
                    onSurnameVisibleChanged: (value) {
                      if (value != null) {
                        setState(() => _surnameVisible = value);
                      }
                    },
                    selectedGender: _currentGender,
                    isSurnameVisible: _surnameVisible,
                  ),
                ],
              ),
            ),
            theme: context.themeData,
          );
        },
      ),
    );
  }
}
