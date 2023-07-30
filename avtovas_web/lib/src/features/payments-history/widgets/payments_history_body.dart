import 'package:avtovas_web/src/features/payments-history/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';

class PaymentsHistoryPageBody extends StatelessWidget {
  const PaymentsHistoryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.rootPadding,
        right: Dimensions.rootPadding,
        top: Dimensions.rootPadding,
      ),
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: Dimensions.emptyPaymentsHistoryBreadcrumbsPaddingBottom,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${context.locale.main} / ${context.locale.help} / ${context.locale.directoryInfo}',
              textAlign: TextAlign.left,
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.emptyPaymentsHistoryTitle,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${context.locale.paymentsHistoryTitle}',
            textAlign: TextAlign.left,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.emptyPaymentsHistoryTitle,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(
            bottom: Dimensions.emptyPaymentsHistoryIconPaddingBottom,
          ),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Dimensions.emptyPaymentsBlockWidth,
              child: AvtovasVectorImage(
                svgAssetPath: ImagesAssets.emptyPaymentsHistoryIcon,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: Dimensions.emptyPaymentsBlockWidth,
            child: Text(
              context.locale.emptyPaymentsHistoryTitle,
              textAlign: TextAlign.center,
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.emptyPaymentsHistoryTitle,
              ),
            ),
          ),
        ),
        Spacer(),
      ]),
    );
  }
}
