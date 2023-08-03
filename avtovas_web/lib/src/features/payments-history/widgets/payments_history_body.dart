import 'package:avtovas_web/src/common/constants/app_assets.dart';
import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:flutter/material.dart';

class PaymentsHistoryPageBody extends StatelessWidget {
  const PaymentsHistoryPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.rootPadding,
        right: AppDimensions.rootPadding,
        top: AppDimensions.rootPadding,
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppDimensions.emptyPaymentsHistoryBreadcrumbsPaddingBottom,
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
            context.locale.paymentsHistoryTitle,
            textAlign: TextAlign.left,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.emptyPaymentsHistoryTitle,
            ),
          ),
        ),
        const Spacer(),
        const Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.emptyPaymentsHistoryIconPaddingBottom,
          ),
          child: Align(
            child: SizedBox(
              width: AppDimensions.emptyPaymentsBlockWidth,
              child: AvtovasVectorImage(
                svgAssetPath: AppAssets.emptyPaymentsHistoryIcon,
              ),
            ),
          ),
        ),
        Align(
          child: SizedBox(
            width: AppDimensions.emptyPaymentsBlockWidth,
            child: Text(
              context.locale.emptyPaymentsHistoryTitle,
              textAlign: TextAlign.center,
              style: context.themeData.textTheme.headlineLarge?.copyWith(
                color: context.theme.emptyPaymentsHistoryTitle,
              ),
            ),
          ),
        ),
        const Spacer(),
      ],),
    );
  }
}
