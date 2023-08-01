import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/bottom_sheet_list/bottom_sheet_list.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyRefundTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final String orderNumber;
  final int numberOfSeats;
  const MyRefundTrip({
    required this.mockTrip,
    required this.orderNumber,
    required this.numberOfSeats,
    super.key,
  });

  Future<void> _showBottomSheet({
    required BuildContext context,
    required String orderNumber,
    required TextStyle? textStyle,
    required VoidCallback downloadRefundReceiptCallback,
    required VoidCallback downloadReceiptCallback,
  }) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetList(
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
            MyTripOrderNumberText(orderNumber: orderNumber),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: AppAssets.refundIcon),
                Text(
                  context.locale.paid,
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    fontWeight: AppFonts.weightRegular,
                    color: context.theme.paymentPendingColor,
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
                  textStyle: mainColorButtonTextStyle,
                  onTap: () {},
                ),
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: AppAssets.moreInfoIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.more,
                  textStyle: mainColorButtonTextStyle,
                  onTap: () => _showBottomSheet(
                    context: context,
                    orderNumber: orderNumber,
                    textStyle: mainColorButtonTextStyle,
                    downloadRefundReceiptCallback: () {},
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
