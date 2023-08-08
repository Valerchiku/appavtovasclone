import 'package:common/src/theme/avtovas_theme.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:common/src/utils/constants/fonts_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore_for_file: unused_element
// ignore_for_file: lines_longer_than_80_chars
const _darkGreen = Color(0xFF006455);
const _green = Color(0xFF269B55);
const _lightGreen = Color(0xFF7CDD00);
const _lightGreenVariant = Color(0xFF40A769);
const _islamicGreen = Color(0xFF00AC11);
const _ultramarineBlue = Color(0xFF346EF1);
const _darkOrange = Color(0xFFC85019);
const _orange = Color(0xFFF1601D);
const _lightOrange = Color(0xFFF37338);
const _darkYellow = Color(0xFFDC9719);
const _yellow = Color(0xFFF5A718);
const _selectiveYellow = Color(0xFFFFB800);
const _lightYellow = Color(0xFFF8C15D);
const _lava = Color(0xFFCF1B1B);
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
const _spaceGray = Color(0xFF7A7A7A);
const _philippineGray = Color(0xFF8C8C8C);
const _gray = Color(0xFF9E9E9E);
const _nickel = Color(0xFFA5A5A5);
const _argent = Color(0xFFEEEEEE);
const _lightGray = Color(0xFFBBBBBB);
const _lightSilver = Color(0xFFD2D8DF);
const _athensGray = Color(0xFFDBDCDC);
const _antiFlashWhite = Color(0xFFE6E6E6);
const _lightCultured = Color(0xFFF4F5F6);
const _cultured = Color(0xFFF8F8F8);
const _white = Color(0xFFFFFFFF);
const _translucentWhite = Color(0xB2FFFFFF);
const _transparent = Color(0x00000000);
const _emptyPaymentsHistoryTitle = Color(0xFFDFDFDF);

const itemIcon = Color(0xFFC6C6C6);
const divider = Color(0xFFEFEFEF);
const _switchTrack = Color(0xFFD9D9D9);
const _passengerPlateBackground = Color(0xFFD9D9D9);

const lightTheme = AvtovasTheme(
  isDark: false,
  mainAppColor: _darkGreen,
  detailsBackgroundColor: _cultured,
  containerBackgroundColor: _white,
  dividerColor: _antiFlashWhite,
  searchHistoryColor: _translucentWhite,
  codeFieldColor: _argent,
  errorColor: _red,
  transparent: _transparent,
  primaryTextColor: _darkGreen,
  secondaryTextColor: _charcoal,
  tertiaryTextColor: _outerSpace,
  quaternaryTextColor: _spaceGray,
  fivefoldTextColor: _nickel,
  whiteTextColor: _white,
  assistiveTextColor: _lightGray,
  reservationExpiryColor: _lava,
  paymentPendingColor: _selectiveYellow,
  paidPaymentColor: _islamicGreen,
  fontFamily: FontsAssets.avtovasFamily,
  itemIcon: itemIcon,
  divider: divider,
  emptyPaymentsHistoryTitle: _emptyPaymentsHistoryTitle,
  navigationBarBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
  switchTrack: _switchTrack,
  passengerPlateBackground: _passengerPlateBackground,
);

ThemeData generateThemeData(AvtovasTheme theme) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: theme.fontFamily,
    // textSelectionTheme для изменения цветов элементов при выборе (selection) текста
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: theme.mainAppColor,
      selectionHandleColor: theme.mainAppColor,
    ),
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
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: theme.transparent,
        statusBarIconBrightness: theme.statusBarBrightness,
        systemNavigationBarColor: theme.transparent,
        systemNavigationBarIconBrightness: theme.navigationBarBrightness,
      ),
    ),
  );
}
