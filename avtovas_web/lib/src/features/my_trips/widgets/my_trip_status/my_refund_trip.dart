// ignore_for_file: implementation_imports

import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/pdf_generation/pdf_generation.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/utils_widgets/support_methods.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyRefundTrip extends StatelessWidget {
  final StatusedTrip trip;
  final VoidCallback onRemoveButtonTap;

  const MyRefundTrip({
    required this.trip,
    required this.onRemoveButtonTap,
    super.key,
  });

  Future<void> _showDeleteAcceptDialog(BuildContext context) {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (_) {
        return AvtovasAlertDialog(
          title: 'Переестить заказ в архив?',
          okayCallback: onRemoveButtonTap,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainColorButtonTextStyle =
        context.themeData.textTheme.titleLarge?.copyWith(
      color: context.theme.mainAppColor,
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AvtovasPlatform.isWeb
            ? context.theme.containerBackgroundColor
            : context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyTripOrderNumberText(
              orderNumber: '${context.locale.orderNum} ${trip.trip.routeNum}',
            ),
            _ExpiredTripTitles(
              departurePlace: trip.trip.departure.name,
              arrivalPlace: trip.trip.destination.name,
            ),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.refundIcon),
                Text(
                  context.locale.refund,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: WebFonts.weightRegular,
                    color: context.theme.paymentPendingColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.small),
            MyTripSeatAndPriceRow(
              numberOfSeats: trip.places.length.toString(),
              ticketPrice: context.locale.price(trip.saleCost),
            ),
            const SizedBox(height: AppDimensions.large),
            Row(
              children: [
                Expanded(
                  child: AvtovasButton.icon(
                    mainAxisAlignment: MainAxisAlignment.center,
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                    svgPath: WebAssets.downloadIcon,
                    buttonColor: context.theme.detailsBackgroundColor,
                    borderColor: context.theme.mainAppColor,
                    buttonText: context.locale.downloadPurchaseReceipt,
                    textStyle: mainColorButtonTextStyle,
                    onTap: () {
                      PDFGenerator.generateAndShowTicketPDF(
                        buildContext: context,
                        statusedTrip: trip,
                        isEmailSending: false,
                        isReturnTicket: true,
                      );
                    },
                  ),
                ),
                const SizedBox(width: AppDimensions.large),
                Expanded(
                  child: AvtovasButton.icon(
                    mainAxisAlignment: MainAxisAlignment.center,
                    padding: const EdgeInsets.all(AppDimensions.mediumLarge),
                    svgPath: WebAssets.moreInfoIcon,
                    buttonColor: context.theme.detailsBackgroundColor,
                    borderColor: context.theme.mainAppColor,
                    buttonText: context.locale.deleteOrder,
                    textStyle: mainColorButtonTextStyle,
                    onTap: () => _showDeleteAcceptDialog(context),
                  ),
                ),
              ],
            ),
          ].insertBetween(
            const SizedBox(
              height: AppDimensions.small,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpiredTripTitles extends StatelessWidget {
  final String departurePlace;
  final String arrivalPlace;

  const _ExpiredTripTitles({
    required this.departurePlace,
    required this.arrivalPlace,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$departurePlace - $arrivalPlace',
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            color: context.theme.mainAppColor,
            fontSize: WebFonts.detailsDescSize,
          ),
        ),
      ],
    );
  }
}
