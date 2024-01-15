import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/pdf_generation/pdf_generation.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/bottom_sheet_list.dart';
import 'package:common/avtovas_common.dart';
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
    return SupportMethods.showAvtovasBottomSheet(
      context: context,
      sheetTitle: 'Действие',
      child: BottomSheetList(
        orderNumber: orderNumber,
        children: [
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
            AppDimensions.medium,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.large),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _CompletedTripTitles(
              orderNumber: '${context.locale.orderNum} ${trip.trip.routeNum}',
              arrivalDate: '',
              departurePlace: trip.trip.departure.name,
              arrivalPlace: trip.trip.destination.name,
            ),
            const SizedBox(height: AppDimensions.small),
            MyTripSeatAndPriceRow(
              numberOfSeats: trip.places.length.toString(),
              ticketPrice: context.locale.price(trip.saleCost),
            ),
            const SizedBox(height: AppDimensions.large),
            MyTripChildren(
              children: [
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: AppAssets.downloadIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.downloadRefundReceipt,
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
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: AppAssets.deleteIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.deleteOrder,
                  textStyle: mainColorButtonTextStyle,
                  onTap: () => _showBottomSheet(
                    context: context,
                    orderNumber: trip.trip.routeNum,
                    textStyle: mainColorButtonTextStyle,
                    downloadRefundReceiptCallback: () {
                      PDFGenerator.generateAndShowTicketPDF(
                        buildContext: context,
                        statusedTrip: trip,
                        isEmailSending: true,
                        isReturnTicket: true,
                      );
                    },
                    downloadReceiptCallback: () {},
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

class _CompletedTripTitles extends StatelessWidget {
  final String orderNumber;
  final String departurePlace;
  final String arrivalPlace;
  final String arrivalDate;

  const _CompletedTripTitles({
    required this.orderNumber,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.arrivalDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderNumber,
          style: context.themeData.textTheme.headlineMedium?.copyWith(
            fontWeight: AppFonts.weightRegular,
          ),
        ),
        MyTripStatusRow(
          statusWidgets: [
            const AvtovasVectorImage(svgAssetPath: AppAssets.refundIcon),
            Text(
              context.locale.refund,
              style: context.themeData.textTheme.headlineMedium?.copyWith(
                fontWeight: AppFonts.weightRegular,
                color: context.theme.paymentPendingColor,
              ),
            ),
          ],
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '$departurePlace -\n$arrivalPlace',
            style: context.themeData.textTheme.headlineMedium?.copyWith(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.detailsDescSize,
            ),
          ),
        ),
        if (arrivalDate.isNotEmpty)
          Text(
            arrivalDate,
            style: context.themeData.textTheme.headlineSmall?.copyWith(
              fontWeight: AppFonts.weightRegular,
            ),
          ),
      ].insertBetween(
        const SizedBox(height: AppDimensions.small),
      ),
    );
  }
}
