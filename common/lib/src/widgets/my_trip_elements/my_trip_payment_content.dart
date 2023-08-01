import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

class MyTripPaymentContent extends StatelessWidget {
  final String ticketPrice;
  final String tariffValue;
  final String commissionValue;
  final String totalValue;
  final VoidCallback payCallback;
  final VoidCallback payByCardCallback;
  const MyTripPaymentContent({
    required this.ticketPrice,
    required this.tariffValue,
    required this.commissionValue,
    required this.totalValue,
    required this.payCallback,
    required this.payByCardCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardPayButtonTextStyle =
        context.themeData.textTheme.titleLarge?.copyWith(
      color: context.theme.mainAppColor,
    );
    return ListView(
      padding: const EdgeInsets.all(CommonDimensions.large),
      shrinkWrap: true,
      children: <Widget>[
        _PaymentHeader(
          title: context.locale.orderPayment,
          svgAssetPath: ImagesAssets.crossIcon,
        ),
        _PaymentOrderDetails(
          orderDetail: '${context.locale.tariff}:',
          orderDetailValue: tariffValue,
        ),
        _PaymentOrderDetails(
          orderDetail: '${context.locale.commission}:',
          orderDetailValue: commissionValue,
        ),
        _PaymentOrderDetails(
          isBold: true,
          orderDetail: '${context.locale.total}:',
          orderDetailValue: totalValue,
        ),
        AvtovasButton.text(
          padding: const EdgeInsets.all(CommonDimensions.large),
          buttonText: '${context.locale.pay} $ticketPrice',
          onTap: payCallback,
        ),
        AvtovasButton.icon(
          mainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.all(CommonDimensions.large),
          buttonColor: context.theme.transparent,
          borderColor: context.theme.mainAppColor,
          svgPath: ImagesAssets.bankCardsLogo,
          buttonText: context.locale.payWithCard,
          textStyle: cardPayButtonTextStyle,
          onTap: payByCardCallback,
        ),
      ].insertBetween(
        const SizedBox(
          height: CommonDimensions.large,
        ),
      ),
    );
  }
}

class _PaymentHeader extends StatelessWidget {
  final String title;
  final String svgAssetPath;
  const _PaymentHeader({
    required this.title,
    required this.svgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: CommonDimensions.none,
      minVerticalPadding: CommonDimensions.none,
      horizontalTitleGap: CommonDimensions.none,
      title: Text(
        title,
        style: context.themeData.textTheme.displaySmall,
      ),
      trailing: AvtovasVectorButton(
        svgAssetPath: svgAssetPath,
        // Потом заменим на нужную вещь
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}

class _PaymentOrderDetails extends StatelessWidget {
  final String orderDetail;
  final String orderDetailValue;
  final bool? isBold;
  const _PaymentOrderDetails({
    required this.orderDetail,
    required this.orderDetailValue,
    this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          orderDetail,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: isBold == null
                ? CommonFonts.weightRegular
                : CommonFonts.weightBold,
          ),
        ),
        Text(
          orderDetailValue,
          style: context.themeData.textTheme.headlineSmall?.copyWith(
            fontWeight: isBold == null
                ? CommonFonts.weightRegular
                : CommonFonts.weightBold,
          ),
        ),
      ],
    );
  }
}
