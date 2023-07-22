import 'package:common/src/theme/avtovas_theme.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/fonts_assets.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_colors.dart';

// ignore_for_file: unused_element

const _darkGreen = Color(0xFF006455);
const _green = Color(0xFF269B55);
const _lightGreen = Color(0xFF7CDD00);
const _lightGreenVariant = Color(0xFF40A769);
const _ultramarineBlue = Color(0xFF346EF1);
const _darkOrange = Color(0xFFC85019);
const _orange = Color(0xFFF1601D);
const _lightOrange = Color(0xFFF37338);
const _darkYellow = Color(0xFFDC9719);
const _yellow = Color(0xFFF5A718);
const _lightYellow = Color(0xFFF8C15D);
const _red = Color(0xFFF61830);
const _darkBrown = Color(0xFF1C0404);

const _black = Color(0xFF000000);
const _raisinBlack = Color(0xFF212121);
const _charlestonGreen = Color(0xFF292929);
const _balticSea = Color(0xFF2B2B2B);
const _darkCharcoal = Color(0xFF333333);
const _jet = Color(0xFF353535);
const _charcoal = Color(0xFF404040);
const _outerSpace = Color(0xFF535353);
const _spaceGray = Color (0xFF7A7A7A);
const _philippineGray = Color(0xFF8C8C8C);
const _gray = Color(0xFF9E9E9E);
const _nickel = Color(0xFFA5A5A5);
const _argent = Color(0xFFC1C1C1);
const _lightSilver = Color(0xFFD2D8DF);
const _athensGray = Color(0xFFDBDCDC);
const _antiFlashWhite = Color(0xFFE6E6E6);
const _lightCultured = Color(0xFFF4F5F6);
const _cultured = Color(0xFFF8F8F8);
const _white = Color(0xFFFFFFFF);

const lightTheme = AvtovasTheme(
  isDark: false,
  mainAppColor: _darkGreen,
  detailsBackgroundColor: _cultured,
  whitespaceContainerColor: _white,
  dividerColor: _antiFlashWhite,
  primaryTextColor: _darkGreen,
  secondaryTextColor: _charcoal,
  tertiaryTextColor: _outerSpace,
  quaternaryTextColor: _spaceGray,
  fivefoldTextColor: _nickel,
  fontFamily: FontsAssets.avtovasFamily,
);

ThemeData generateThemeData(AvtovasTheme theme) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: theme.fontFamily,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: CommonFonts.weightRegular,
        fontSize: CommonFonts.sizeDisplayLarge,
      ),
      displayMedium: TextStyle(
        fontWeight: CommonFonts.weightBold,
        fontSize: CommonFonts.sizeDisplayMedium,
      ),
      displaySmall: TextStyle(
        fontWeight: CommonFonts.weightBold,
        fontSize: CommonFonts.sizeDisplaySmall,
      ),
      headlineLarge: TextStyle(
        fontWeight: CommonFonts.weightRegular,
        fontSize: CommonFonts.sizeDisplayMedium,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      headlineMedium: TextStyle(
        fontWeight: CommonFonts.weightBold,
        fontSize: CommonFonts.sizeHeadlineMedium,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      headlineSmall: TextStyle(
        fontWeight: CommonFonts.weightBold,
        fontSize: CommonFonts.sizeHeadlineSmall,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      titleLarge: TextStyle(
        fontWeight: CommonFonts.weightRegular,
        fontSize: CommonFonts.sizeHeadlineSmall,
        letterSpacing: CommonFonts.letterSpacing,
      ),
      titleMedium: TextStyle(
        fontWeight: CommonFonts.weightBold,
        fontSize: CommonFonts.sizeTitleMedium,
      ),
      titleSmall: TextStyle(
        fontWeight: CommonFonts.weightRegular,
        fontSize: CommonFonts.sizeTitleMedium,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );
}


class AvtovasBtnStyle extends ButtonStyle {
  AvtovasBtnStyle()
      : super(
            maximumSize: MaterialStateProperty.all<Size>(Size(
                CommonDimensions.datePickerBtnWidth, CommonDimensions.datePickerBtnHeight)),
            minimumSize: MaterialStateProperty.all<Size>(Size(
                CommonDimensions.datePickerBtnWidth, CommonDimensions.datePickerBtnHeight)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(CommonDimensions.datePickerBtnRadius),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(
                CommonColors.datePickerBtnBackground),
            foregroundColor: MaterialStateProperty.all<Color>(
                CommonColors.datePickerBtnForeground));
}
