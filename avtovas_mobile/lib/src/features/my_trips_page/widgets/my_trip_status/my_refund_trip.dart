import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/list_extension.dart';
import 'package:common/src/widgets/my_trip_elements/my_trip_children.dart';
import 'package:common/src/widgets/my_trip_elements/my_trip_details.dart';
import 'package:common/src/widgets/my_trip_elements/my_trip_order_number_text.dart';
import 'package:common/src/widgets/my_trip_elements/my_trip_seat_and_price_row.dart';
import 'package:common/src/widgets/my_trip_elements/my_trip_status_row.dart';
import 'package:common/src/widgets/page_option_tile/page_option_tile.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

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
      builder: (context) => ListView(
        padding: const EdgeInsets.all(AppDimensions.large),
        shrinkWrap: true,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            title: Text(
              orderNumber,
              style: context.themeData.textTheme.displaySmall,
            ),
            trailing: AvtovasVectorButton(
              svgAssetPath: AppAssets.crossIcon,
              // Потом заменим на нужную вещь
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
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
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.detailsBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            AppDimensions.medium,
          ),
        ),
      ),
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
                  downloadRefundReceiptCallback: (){},
                  downloadReceiptCallback: (){},
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
    );
  }
}
