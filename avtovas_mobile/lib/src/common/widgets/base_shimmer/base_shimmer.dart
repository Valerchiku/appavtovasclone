import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final class BaseShimmer extends StatelessWidget {
  final double? shimmerWidth;
  final double? shimmerHeight;
  final EdgeInsets? margin;

  const BaseShimmer({
    this.shimmerWidth,
    this.shimmerHeight,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const elevation = 0.0;

    return Padding(
      padding: margin ??
          const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
            vertical: AppDimensions.medium,
          ),
      child: SizedBox(
        height: shimmerHeight ?? AppDimensions.shimmerButtonHeight,
        child: Shimmer.fromColors(
          baseColor: context.theme.codeFieldColor,
          highlightColor: context.theme.whiteTextColor,
          child: SizedBox(
            // ignore: ambiguous_extension_member_access
            width: shimmerWidth ?? context.availableWidth,
            height: shimmerHeight ?? AppDimensions.shimmerButtonHeight,
            child: Card(
              elevation: elevation,
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.large),
                ),
              ),
              color: context.theme.quaternaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
