// ignore_for_file: implementation_imports

import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/widgets/utils_widgets/support_methods.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyRefundTrip extends StatelessWidget {
  final StatusedTrip trip;

  const MyRefundTrip({
    required this.trip,
    super.key,
  });

  Future<void> _showBottomSheet({
    required BuildContext context,
    required String orderNumber,
    required TextStyle? textStyle,
    required VoidCallback downloadRefundReceiptCallback,
    required VoidCallback downloadReceiptCallback,
  }) async {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (p0) => AvtovasAlertDialog(
        title: orderNumber,
        actions: [
          PageOptionTile(
            title: context.locale.downloadPurchaseReceipt,
            textStyle: textStyle,
            onTap: downloadRefundReceiptCallback,
          ),
          PageOptionTile(
            title: context.locale.downloadRefundReceipt,
            textStyle: textStyle,
            onTap: downloadReceiptCallback,
          ),
        ],
      ),
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
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            WebDimensions.medium,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(WebDimensions.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyTripOrderNumberText(
              orderNumber: '${context.locale.orderNum} ${trip.trip.routeNum}',
            ),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.refundIcon),
                Text(
                  context.locale.paid,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: WebFonts.weightRegular,
                    color: context.theme.paymentPendingColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: WebDimensions.small),
            MyTripDetails(
              arrivalDateTime: trip.trip.arrivalTime,
              departureDateTime: trip.trip.departureTime,
              arrivalAddress: trip.trip.destination.address ?? '',
              departureAddress: trip.trip.departure.address ?? '',
              departurePlace: trip.trip.departure.name,
              arrivalPlace: trip.trip.destination.name,
              timeInRoad: trip.trip.duration.formatDuration(),
            ),
            MyTripSeatAndPriceRow(
              numberOfSeats: trip.places.length.toString(),
              ticketPrice: context.locale.price(trip.saleCost),
            ),
            const SizedBox(height: WebDimensions.large),
            MyTripChildren(
              children: [
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(WebDimensions.large),
                  svgPath: WebAssets.downloadIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.downloadTicket,
                  textStyle: mainColorButtonTextStyle,
                  onTap: () {},
                ),
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(WebDimensions.large),
                  svgPath: WebAssets.moreInfoIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.more,
                  textStyle: mainColorButtonTextStyle,
                  onTap: () => _showBottomSheet(
                    context: context,
                    orderNumber: trip.trip.routeNum,
                    textStyle: mainColorButtonTextStyle,
                    downloadRefundReceiptCallback: () {},
                    downloadReceiptCallback: () {},
                  ),
                ),
              ],
            ),
          ].insertBetween(
            const SizedBox(
              height: WebDimensions.small,
            ),
          ),
        ),
      ),
    );
  }
}
