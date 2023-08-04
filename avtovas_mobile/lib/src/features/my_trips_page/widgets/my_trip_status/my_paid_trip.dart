import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/bottom_sheet_list/bottom_sheet_list.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

class MyPaidTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final String orderNumber;
  final int numberOfSeats;
  const MyPaidTrip({
    required this.mockTrip,
    required this.orderNumber,
    required this.numberOfSeats,
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
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetList(
        orderNumber: orderNumber,
        children: [
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
            MyTripOrderNumberText(orderNumber: orderNumber),
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
            MyTripDetails(mockTrip: mockTrip),
            MyTripSeatAndPriceRow(
              numberOfSeats: '$numberOfSeats',
              ticketPrice: mockTrip.ticketPrice,
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
                  onTap: () {},
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
