import 'dart:ui';

import 'package:equatable/equatable.dart';

final class AvtovasTheme extends Equatable {
  final bool isDark;

  final Color mainAppColor;
  final Color detailsBackgroundColor;
  final Color containerBackgroundColor;
  final Color backgroundOpacityColor;
  final Color dividerColor;
  final Color searchHistoryColor;
  final Color codeFieldColor;
  final Color errorColor;
  final Color transparent;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color tertiaryTextColor;
  final Color quaternaryTextColor;
  final Color fivefoldTextColor;
  final Color whiteTextColor;

  final Color assistiveTextColor;

  final Color reservationExpiryColor;
  final Color paymentPendingColor;
  final Color paidPaymentColor;
  final String fontFamily;
  final Color emptyPaymentsHistoryTitle;
  final Brightness statusBarBrightness;
  final Brightness navigationBarBrightness;

  final Color switchTrack;
  final Color passengerPlateBackground;

  @override
  List<Object?> get props => [
        isDark,
        mainAppColor,
        detailsBackgroundColor,
        containerBackgroundColor,
        dividerColor,
        searchHistoryColor,
    backgroundOpacityColor,
        codeFieldColor,
        errorColor,
        transparent,
        primaryTextColor,
        secondaryTextColor,
        tertiaryTextColor,
        quaternaryTextColor,
        fivefoldTextColor,
        whiteTextColor,
        assistiveTextColor,
        reservationExpiryColor,
        paymentPendingColor,
        paidPaymentColor,
        fontFamily,
        emptyPaymentsHistoryTitle,
        statusBarBrightness,
        navigationBarBrightness,
        switchTrack,
        passengerPlateBackground,
      ];

  const AvtovasTheme({
    required this.isDark,
    required this.mainAppColor,
    required this.detailsBackgroundColor,
    required this.containerBackgroundColor,
    required this.dividerColor,
    required this.searchHistoryColor,
    required this.backgroundOpacityColor,
    required this.codeFieldColor,
    required this.errorColor,
    required this.transparent,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.quaternaryTextColor,
    required this.fivefoldTextColor,
    required this.whiteTextColor,
    required this.assistiveTextColor,
    required this.reservationExpiryColor,
    required this.paymentPendingColor,
    required this.paidPaymentColor,
    required this.fontFamily,
    required this.emptyPaymentsHistoryTitle,
    required this.statusBarBrightness,
    required this.navigationBarBrightness,
    required this.switchTrack,
    required this.passengerPlateBackground,
  });
}
