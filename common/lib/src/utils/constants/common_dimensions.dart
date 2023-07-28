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

  // InputField value
  static const int defaultMinLines = 1;
  static const int defaultMaxLines = 2;
  static const int expandedMinLines = 7;
  static const int expandedMaxLines = 8;

  // Align value?
  static const double webHeightFactor = 1.4;

  static const double mobileHeightFactor = 3;

  static const double contactsPaddingLeft = 20;
  static const double contactsPaddingTop = 21;
  static const double labelFont = 14;
  static const double titleFont = 18;
  static const double contactsItemTitleMarginTop = 20;
  static const double contactsItemLabelMarginTop = 10;
  static const double labelMarginTop = 10;
  static const double labelSectionMarginTop = 20;

}

extension AvailableSize on BuildContext {
  double get availableWidth => MediaQuery.of(this).size.width;

  double get availableHeight => MediaQuery.of(this).size.height;
}
