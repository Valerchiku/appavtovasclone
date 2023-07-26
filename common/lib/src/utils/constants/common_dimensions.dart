import 'package:flutter/material.dart';

abstract final class CommonDimensions {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
  static const double extraLarge = 32;

  // Another value?
  static const double expandedTripMargin = 108;

  static const double pointPadding = 1;

  static const double expandedTripLineWidth = 260;
  static const double verticalTripLineHeight = 130;

  static const double maxNonSmartWidth = 1000;

  static const double datePickerBtnRadius = 5;

  static const double datePickerBtnWidth = 105;

  static const double datePickerBtnHeight = 33;

  static const double selectorHeight = 45;
  static const double dateBtnLabelMarginLeft = 13.81;
  static const double logoWidth = 270.25;
  static const double logoHeight = 138.38;
  static const double recentTripPaddingLeft = 14;
  static const double recentTripPaddingTop = 6;
  static const double recentTripWidth = 162;
  static const double recentTripHeight = 48;
  static const double fromTripSelectorMarginTop = 39;
  static const double toggleBtnBorder = 1;
  static const double selectorMarginTop = 10;
  static const double selectorRadius = 5;
  static const double titleSize = 30;
  static const double selectorPaddingLeft = 12;
  static const double selectorPaddingVertical = 15;
  static const double clearHistoryLabelMarginTop = 16;
  static const double recentItemsMarginTop = 18;
  static const double recentMarginTop = 42;
  static const double recentIconMarginLeft = 15;
  static const double rootPaddingHorizontal = 29;
  static const double rootPaddingTop = 79;
  static const double rootPaddingBottom = 30;
  static const double dateFilterMarginTop = 10;
  static const double recentTripMarginLeft = 5;
  static const double recentTripRadius = 9;
  static const BorderRadius selectorBorderRadius =
      BorderRadius.all(Radius.circular(selectorRadius));

  // InputField value
  static const int defaultMinLines = 1;
  static const int defaultMaxLines = 2;
  static const int expandedMinLines = 7;
  static const int expandedMaxLines = 8;

  // Align value?
  static const double webHeightFactor = 1.4;

  static const double mobileHeightFactor = 3;
}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
