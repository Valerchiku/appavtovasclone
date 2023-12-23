import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_assets.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/common/pdf_generation/pdf_generation.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/widgets/utils_widgets/support_methods.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyPaidTrip extends StatelessWidget {
  final StatusedTrip trip;
  final String orderNumber;

  const MyPaidTrip({
    required this.trip,
    required this.orderNumber,
    super.key,
  });

  Future<void> _showBottomSheet({
    required BuildContext context,
    required String orderNumber,
    required TextStyle? textStyle,
    required VoidCallback sendEmailCallback,
    required VoidCallback downloadReceiptCallback,
    required VoidCallback refundTicketCallback,
  }) async {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (p0) => AvtovasAlertDialog(
        title: '${context.locale.orderNum} $orderNumber',
        actions: [
          PageOptionTile(
            title: context.locale.sendToEmail,
            textStyle: textStyle,
            onTap: sendEmailCallback,
          ),
          PageOptionTile(
            title: context.locale.downloadPurchaseReceipt,
            textStyle: textStyle,
            onTap: downloadReceiptCallback,
          ),
          PageOptionTile(
            title: context.locale.refundTicket,
            textStyle: textStyle,
            onTap: refundTicketCallback,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainColorTextStyle = context.themeData.textTheme.titleLarge?.copyWith(
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
            MyTripOrderNumberText(orderNumber: orderNumber),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: WebAssets.paidIcon),
                Text(
                  context.locale.paid,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: WebFonts.weightRegular,
                    color: context.theme.paidPaymentColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.small),
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
              numberOfSeats: trip.places.join(', '),
              ticketPrice: context.locale.price(trip.saleCost),
            ),
            const SizedBox(height: AppDimensions.large),
            MyTripChildren(
              children: [
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: WebAssets.downloadIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.downloadTicket,
                  textStyle: mainColorTextStyle,
                  onTap: () {
                    PDFGenerator.generateAndShowTicketPDF(
                      buildContext: context,
                      statusedTrip: trip,
                      isEmailSending: false,
                      isReturnTicket: false,
                    );
                  },
                ),
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: WebAssets.moreInfoIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.more,
                  textStyle: mainColorTextStyle,
                  onTap: () => _showBottomSheet(
                    context: context,
                    orderNumber: orderNumber,
                    textStyle: mainColorTextStyle,
                    sendEmailCallback: () {},
                    downloadReceiptCallback: () {},
                    refundTicketCallback: () {},
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
