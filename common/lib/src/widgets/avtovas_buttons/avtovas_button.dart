import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/widgets/vector_image/avtovas_vector_image.dart';
import 'package:flutter/material.dart';

final class AvtovasButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final String? svgPath;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final MainAxisAlignment? mainAxisAlignment;
  const AvtovasButton.text({
    required this.buttonText,
    required this.onTap,
    this.textStyle,
    this.buttonColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  }) : svgPath = null;

  const AvtovasButton.icon({
    required this.buttonText,
    required this.svgPath,
    required this.onTap,
    this.textStyle,
    this.buttonColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: buttonColor ?? context.theme.mainAppColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(CommonDimensions.small),
              ),
          side: borderColor != null
              ? BorderSide(
                  color: borderColor ?? context.theme.mainAppColor,
                )
              : BorderSide.none,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ??
              const BorderRadius.all(
                Radius.circular(CommonDimensions.small),
              ),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                  horizontal: CommonDimensions.large,
                  vertical: CommonDimensions.medium,
                ),
            child: Center(
              child: svgPath == null
                  ? Text(
                      buttonText,
                      style: textStyle ??
                          context.themeData.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                    )
                  : Row(
                      mainAxisAlignment: mainAxisAlignment!,
                      children: [
                        AvtovasVectorImage(svgAssetPath: svgPath!),
                        const SizedBox(width: CommonDimensions.large),
                        Text(
                          buttonText,
                          style: textStyle ??
                              context.themeData.textTheme.titleLarge?.copyWith(
                                color: context.theme.whiteTextColor,
                              ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
