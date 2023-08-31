import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/common/cubit_scope/cubit_scope.dart';
import 'package:avtovas_mobile/src/common/shared_cubit/navigation_panel/navigation_panel_cubit.dart';
import 'package:avtovas_mobile/src/features/main/cubit/my_trips_cubit/my_trips_cubit.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class MyExpiredTrip extends StatelessWidget {
  final MockTrip mockTrip;
  final String orderNumber;
  final MyTripsCubit myTripsCubit;
  const MyExpiredTrip({
    required this.mockTrip,
    required this.orderNumber,
    required this.myTripsCubit,
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
                  onTap: CubitScope.of<NavigationPanelCubit>(context)
                          .toggleDeleteUpcomingTripDialog,
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
