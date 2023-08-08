import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:common/avtovas_common_widgets.dart';
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
    required String title,
    required VoidCallback okayCallback,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AvtovasAlertDialog(
        title: title,
        okayCallback: okayCallback,
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
                    title: context.locale.confirmOrderReturn,
                    okayCallback: () {},
                  ),
                ),
                PageOptionTile(
                  title: context.locale.deleteOrder,
                  textStyle: expiredIconTextStyle,
                  onTap: () => _showAlertDialog(
                    context: context,
                    title: context.locale.confirmOrderDeletion,
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
