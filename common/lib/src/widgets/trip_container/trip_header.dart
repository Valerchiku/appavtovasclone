import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

final class TripHeader extends StatelessWidget {
  final String tripNumber;
  final String tripRoot;

  const TripHeader({
    required this.tripNumber,
    required this.tripRoot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTitleSmall = context.themeData.textTheme.titleSmall;

    return Row(
      children: [
        const AvtovasVectorImage(
          svgAssetPath: ImagesAssets.busIcon,
          width: CommonDimensions.extraLarge,
          height: CommonDimensions.extraLarge,
        ),
        const SizedBox(width: CommonDimensions.large),
        if (AvtovasPlatform.isWeb)
          Row(
            children: [
              Text(
                tripNumber,
                style: textTitleSmall,
              ),
              const SizedBox(width: CommonDimensions.medium),
              const _HeaderPoint(),
              const SizedBox(width: CommonDimensions.medium),
              Text(
                tripRoot,
                style: textTitleSmall,
              ),
            ],
          ),
        if (AvtovasPlatform.isMobile)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tripNumber,
                  style: textTitleSmall,
                ),
                Row(
                  children: [
                    const _HeaderPoint(),
                    const SizedBox(width: CommonDimensions.small),
                    Flexible(
                      child: Text(
                        tripRoot,
                        style: textTitleSmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}

final class _HeaderPoint extends StatelessWidget {
  const _HeaderPoint();

  @override
  Widget build(BuildContext context) {
    final mainAppColor = context.theme.mainAppColor;

    return Container(
      width: CommonDimensions.large - CommonDimensions.small,
      height: CommonDimensions.large - CommonDimensions.small,
      padding: const EdgeInsets.all(CommonDimensions.pointPadding),
      decoration: BoxDecoration(
        border: Border.all(
          color: mainAppColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.extraLarge),
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: mainAppColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(CommonDimensions.extraLarge),
          ),
        ),
      ),
    );
  }
}
