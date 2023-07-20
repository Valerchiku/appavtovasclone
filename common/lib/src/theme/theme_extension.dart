import 'package:common/src/theme/avtovas_theme.dart';
import 'package:common/src/theme/theme_provider.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AvtovasTheme get theme => ThemeProvider.of(this).theme;

  ThemeData get themeData => ThemeProvider.of(this).themeData;
}
