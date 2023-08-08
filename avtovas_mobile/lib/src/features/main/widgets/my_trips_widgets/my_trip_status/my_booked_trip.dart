import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyBookedTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final String orderNumber;
  final int bookingTimer;
  final int numberOfSeats;
  const MyBookedTrip({
    required this.mockTrip,
    required this.orderNumber,
    required this.bookingTimer,
    required this.numberOfSeats,
    super.key,
  });

  Future<void> _showPaymentBottomSheet({
    required BuildContext context,
    required String ticketPrice,
    required String tariffValue,
    required String commissionValue,
    required String totalValue,
    required VoidCallback payCallback,
    required VoidCallback payByCardCallback,
  }) async {
    await showModalBottomSheet<dynamic>(
      context: context,
      builder: (context) => MyTripPaymentContent(
        ticketPrice: ticketPrice,
        tariffValue: tariffValue,
        commissionValue: commissionValue,
        totalValue: totalValue,
        payCallback: payCallback,
        payByCardCallback: payByCardCallback,
      ),
    );
  }

  Future<void> _showDeleteAlert({
    required BuildContext context,
    required VoidCallback okayCallback,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AvtovasAlertDialog(
        title: context.locale.confirmOrderDeletion,
        okayCallback: okayCallback,
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
            MyTripBookingTimer(bookingTimer: bookingTimer),
            MyTripStatusRow(
              statusWidgets: [
                const AvtovasVectorImage(svgAssetPath: AppAssets.warningIcon),
                Text(
                  context.locale.awaitingPayment,
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
                AvtovasButton.text(
                  padding: const EdgeInsets.all(AppDimensions.large),
                  buttonText: '${context.locale.pay} ${mockTrip.ticketPrice}',
                  onTap: () => _showPaymentBottomSheet(
                    context: context,
                    ticketPrice: mockTrip.ticketPrice,
                    tariffValue: '000',
                    commissionValue: '000',
                    totalValue: '000',
                    payCallback: () {},
                    payByCardCallback: () {},
                  ),
                ),
                AvtovasButton.icon(
                  mainAxisAlignment: MainAxisAlignment.center,
                  padding: const EdgeInsets.all(AppDimensions.large),
                  svgPath: AppAssets.deleteIcon,
                  buttonColor: context.theme.detailsBackgroundColor,
                  borderColor: context.theme.mainAppColor,
                  buttonText: context.locale.deleteOrder,
                  textStyle: mainColorTextStyle,
                  onTap: () => _showDeleteAlert(
                    context: context,
                    okayCallback: () {},
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
