import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;

import 'benefit.dart';

class SearchBenefitsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SearchDimensions.Dimensions.benefitsMarginTop,
            bottom: SearchDimensions.Dimensions.benefitsMarginBottom),
        child: Wrap(children: [
          BenefitWidget(
              title: context.locale.timeBenefitTitle,
              subtitle: context.locale.timeBenefitSubtitle,
              icon: ImagesAssets.timeIcon),
          BenefitWidget(
              title: context.locale.tripsBenefitTitle,
              subtitle: context.locale.tripsBenefitSubtitle,
              icon: ImagesAssets.tripsIcon),
          BenefitWidget(
              title: context.locale.paymentBenefitTitle,
              subtitle: context.locale.paymentBenefitSubtitle,
              icon: ImagesAssets.safetyIcon),
          BenefitWidget(
              title: context.locale.refundBenefitTitle,
              subtitle: context.locale.refundBenefitSubtitle,
              icon: ImagesAssets.refundIcon),
        ]));
  }
}
