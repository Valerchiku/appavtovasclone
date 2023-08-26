import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

final class BaseShimmer extends StatelessWidget {
  final double? shimmerWidth;
  final double? shimmerHeight;
  final EdgeInsets? margin;
  final Color? baseColor;
  final double? radius;

  const BaseShimmer({
    this.shimmerWidth,
    this.shimmerHeight,
    this.margin,
    this.baseColor,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const elevation = 0.0;

    return Padding(
      padding: margin ??
          const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
            vertical: CommonDimensions.medium,
          ),
      child: SizedBox(
        height: shimmerHeight ?? CommonDimensions.shimmerButtonHeight,
        child: Shimmer.fromColors(
          baseColor: baseColor ?? context.theme.codeFieldColor,
          highlightColor: context.theme.whiteTextColor,
          child: SizedBox(
            // ignore: ambiguous_extension_member_access
            width: shimmerWidth ?? MediaQuery.sizeOf(context).width,
            height: shimmerHeight ?? CommonDimensions.shimmerButtonHeight,
            child: Card(
              elevation: elevation,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? CommonDimensions.large),
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
