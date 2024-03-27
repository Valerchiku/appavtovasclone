import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class AvtovasVectorButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String svgAssetPath;
  final EdgeInsets? innerPadding;
  final double? cornerRadius;
  final Color? iconColor;

  const AvtovasVectorButton({
    required this.onTap,
    required this.svgAssetPath,
    this.innerPadding,
    this.cornerRadius,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        borderRadius: BorderRadius.all(
          Radius.circular(
            cornerRadius ?? CommonDimensions.extraLarge,
          ),
        ),
        child: Container(
          padding: innerPadding ??
              const EdgeInsets.all(
                CommonDimensions.large,
              ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                cornerRadius ?? CommonDimensions.extraLarge,
              ),
            ),
          ),
          child: AvtovasVectorImage(
            svgAssetPath: svgAssetPath,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
