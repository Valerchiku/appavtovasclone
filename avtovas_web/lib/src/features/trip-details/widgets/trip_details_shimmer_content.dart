import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class TripDetailsShimmerContent extends StatelessWidget {
  const TripDetailsShimmerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final headlineMedium = context.themeData.textTheme.headlineMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: context.theme.quaternaryTextColor,
    );
    const bigShimmerHeight = 400.0;
    const smallShimmerHeight = 200.0;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimensions.medium,
        horizontal: AppDimensions.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseShimmer(
            margin: EdgeInsets.zero,
            shimmerWidth: 260,
            shimmerHeight: 20,
            radius: 4,
          ),
          const SizedBox(height: AppDimensions.large),
          const BaseShimmer(
            margin: EdgeInsets.zero,
            shimmerWidth: 360,
            shimmerHeight: 40,
            radius: 4,
          ),
          Text(
            context.locale.flight,
            style: headlineMedium,
          ),
          const SizedBox(height: AppDimensions.medium),
          const BaseShimmer(
            margin: EdgeInsets.zero,
            shimmerWidth: double.maxFinite,
            shimmerHeight: bigShimmerHeight,
          ),
          Text(
            context.locale.carrier,
            style: headlineMedium,
          ),
          const SizedBox(height: AppDimensions.medium),
          const BaseShimmer(
            margin: EdgeInsets.zero,
            shimmerWidth: double.maxFinite,
            shimmerHeight: smallShimmerHeight,
          ),
        ],
      ),
    );
  }
}
