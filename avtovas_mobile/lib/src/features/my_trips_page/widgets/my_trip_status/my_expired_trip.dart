import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyExpiredTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final String orderNumber;
  const MyExpiredTrip({
    required this.mockTrip,
    required this.orderNumber,
    super.key,
  });

  Future<void> _showAlertDialog({
    required BuildContext context,
    required String textContent,
    required VoidCallback okayCallback,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(textContent),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    context.locale.cancel.toUpperCase(),
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.mainAppColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: okayCallback,
                  child: Text(
                    context.locale.ok,
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.mainAppColor,
                    ),
                  ),
                ),
              ],
            ),
          ].insertBetween(
            const SizedBox(
              height: AppDimensions.large,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expiredIconTextStyle =
        context.themeData.textTheme.headlineMedium?.copyWith(
      fontWeight: AppFonts.weightRegular,
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
              const AvtovasVectorImage(svgAssetPath: AppAssets.expiredIcon),
              Text(
                context.locale.bookingExpired,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  fontWeight: AppFonts.weightRegular,
                  color: context.theme.reservationExpiryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.small),
          MyTripDetails(mockTrip: mockTrip),
          MyTripChildren(
            children: [
              PageOptionTile(
                title: context.locale.rebookOrder,
                textStyle: expiredIconTextStyle,
                onTap: () => _showAlertDialog(
                  context: context,
                  textContent: context.locale.confirmOrderReturn,
                  okayCallback: () {},
                ),
              ),
              PageOptionTile(
                title: context.locale.deleteOrder,
                textStyle: expiredIconTextStyle,
                onTap: () => _showAlertDialog(
                  context: context,
                  textContent: context.locale.confirmOrderDeletion,
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
    );
  }
}
