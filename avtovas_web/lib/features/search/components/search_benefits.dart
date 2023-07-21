import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:avtovas_web/features/search/utils/constants/dimensions.dart'
    as SearchDimensions;

import 'benefit.dart';

class SearchBenefitsWidget extends StatefulWidget {
  const SearchBenefitsWidget({super.key});

  @override
  State<SearchBenefitsWidget> createState() => _SearchBenefitsWidgetState();
}

class _SearchBenefitsWidgetState extends State<SearchBenefitsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Wrap(children: [
          BenefitWidget(
              title: context.locale.time_benefit_title,
              subtitle: context.locale.time_benefit_subtitle,
              icon: ImagesAssets.timeIcon),
          BenefitWidget(
              title: context.locale.trips_benefit_title,
              subtitle: context.locale.trips_benefit_subtitle,
              icon: ImagesAssets.tripsIcon),
          BenefitWidget(
              title: context.locale.payment_benefit_title,
              subtitle: context.locale.payment_benefit_subtitle,
              icon: ImagesAssets.safetyIcon),
          BenefitWidget(
              title: context.locale.refund_benefit_title,
              subtitle: context.locale.refund_benefit_subtitle,
              icon: ImagesAssets.refundIcon),
        ]),
        margin: EdgeInsets.only(
            top: SearchDimensions.Dimensions.benefitsMarginTop,
            bottom: SearchDimensions.Dimensions.benefitsMarginBottom));
  }
}
