import 'package:flutter/material.dart';

abstract final class CommonDimensions {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double mediumLarge = 12;
  static const double large = 16;
  static const double extraLarge = 32;

  static const double checkBoxSize = 24;
  static const double checkboxBorderWidth = 0.5;

  static const double shimmerButtonHeight = 50;

  // Another value?
  static const double expandedTripMargin = 108;

  static const double pointPadding = 1;

  static const double expandedTripLineWidth = 260;
  static const double verticalTripLineHeight = 130;

  static const double codeFieldSize = 50;

  static const double maxNonSmartWidth = 1000;
  
  static const double maxSmartWidth = 1100;

  // InputField value
  static const int defaultMinLines = 1;
  static const int defaultMaxLines = 2;
  static const int expandedMinLines = 7;
  static const int expandedMaxLines = 8;

  // Align value?
  static const double webHeightFactor = 1.4;

  static const double itemMarginTop = 13;
  static const double rootPaddingHorizontal = 20;
  static const double passengerPlateSize = 43;

  static const double mobileHeightFactor = 2.3;
}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
