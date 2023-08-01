import 'package:flutter/material.dart';

abstract final class AppDimensions {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double mediumLarge = 12;
  static const double large = 16;
  static const double preExtraLarge = 24;
  static const double extraLarge = 32;

  static const double navigationPanelHeight = 80;
  static const double navigationPanelIconSize = 20;
}

extension AvailableSize on BuildContext {
  double get availableHeight => MediaQuery.sizeOf(this).height;

  double get availableWidth => MediaQuery.sizeOf(this).width;
}
