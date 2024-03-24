import 'package:another_flushbar/flushbar.dart';
import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/pdf_generation/pdf_generation.dart';
import 'package:avtovas_mobile/src/common/widgets/support_methods/support_methods.dart';
import 'package:avtovas_mobile/src/features/main/widgets/my_trips_widgets/bottom_sheet_list.dart';
import 'package:common/avtovas_common.dart';
import 'package:core/avtovas_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyPaidTrip extends StatelessWidget {
  final StatusedTrip trip;
  final VoidCallback onRefundTap;
  final ValueSetter<Uint8List> onSendTicketToEmailTap;
  final String orderNumber;
  final String userEmail;

  const MyPaidTrip({
    required this.onSendTicketToEmailTap,
    required this.trip,
    required this.onRefundTap,
    required this.orderNumber,
    required this.userEmail,
    super.key,
  });

  Future<void> _showTicketEmailSendingFlushbar(BuildContext context) {
    return Flushbar(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.large),
      ),
      backgroundColor: context.theme.whiteTextColor,
      titleText: Text(
        'Билет успешно отправлен на электронную почту $userEmail',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: AppFonts.appBarFontSize,
        ),
      ),
      isDismissible: false,
      duration: const Duration(seconds: 7),
      animationDuration: const Duration(milliseconds: 150),
      messageText: Text(
        'Спасибо, что продолжаете пользоваться нашей системой☺',
        style: context.themeData.textTheme.bodyLarge?.copyWith(
          fontSize: AppFonts.sizeHeadlineMedium,
        ),
      ),
    ).show(context);
  }

  Future<void> _showBottomSheet({
    required BuildContext context,
    required String orderNumber,
    required TextStyle? textStyle,
  }) async {
    return SupportMethods.showAvtovasDialog(
      context: context,
      builder: (context) {
        return AvtovasAlertDialog(
          title: orderNumber,
          actions: [
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
              child: PageOptionTile(
                title: context.locale.sendToEmail,
                textStyle: textStyle,
                onTap: () => _onSendTicketToEmailTap(context),
              ),
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.medium,
              ),
              child: PageOptionTile(
                title: context.locale.refundTicket,
                textStyle: textStyle,
                onTap: () {
                  onRefundTap();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _onSendTicketToEmailTap(BuildContext context) async {
    Navigator.pop(context);

    _showTicketEmailSendingFlushbar(context);

    final ticketBytes = await PDFGenerator.generatePdfBytesArray(
      buildContext: context,
      statusedTrip: trip,
      isReturnTicket: false,
    );

    onSendTicketToEmailTap(ticketBytes);
  }

  @override
  Widget build(BuildContext context) {
    final mainColorTextStyle = context.themeData.textTheme.titleLarge?.copyWith(
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
            MyTripOrderNumberText(
              orderNumber: context.locale.orderNum + orderNumber,
            ),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: AppAssets.paidIcon),
                Text(
                  context.locale.paid,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: AppFonts.weightRegular,
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
                  svgPath: AppAssets.downloadIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.downloadTicket,
                  textStyle: mainColorTextStyle,
                  onTap: () => PDFGenerator.generateAndShowTicketPDF(
                    buildContext: context,
                    statusedTrip: trip,
                    isEmailSending: false,
                    isReturnTicket: false,
                  ),
                ),
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: AppAssets.moreInfoIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.more,
                  textStyle: mainColorTextStyle,
                  onTap: () => _showBottomSheet(
                    context: context,
                    orderNumber: context.locale.orderNum + orderNumber,
                    textStyle: mainColorTextStyle,
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

// Чебоксары
// Йошкар
