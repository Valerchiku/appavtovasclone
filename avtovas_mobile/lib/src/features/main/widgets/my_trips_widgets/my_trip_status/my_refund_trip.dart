import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/pdf_generation/pdf_generation.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/material.dart';

class MyRefundTrip extends StatelessWidget {
  final StatusedTrip trip;
  final VoidCallback tripRemoveCallback;

  const MyRefundTrip({
    required this.trip,
    required this.tripRemoveCallback,
    super.key,
  });

  Future<void> _showAlertDialog({
    required BuildContext context,
    required String title,
    required VoidCallback okayCallback,
  }) async {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) => AvtovasAlertDialog(
        title: title,
        okayCallback: okayCallback,
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
              ticketPrice: '${trip.saleCost} РУБ.',
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
                  onTap: () => _showAlertDialog(
                    context: context,
                    title: context.locale.confirmOrderDeletion,
                    okayCallback: tripRemoveCallback,
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
