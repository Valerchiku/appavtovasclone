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
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AvtovasButton.text({
    required this.buttonText,
    required this.onTap,
    this.textStyle,
    this.buttonColor,
    this.borderRadius,
    this.padding,
    this.margin,
    super.key,
  }) : svgPath = null;

  const AvtovasButton.icon({
    required this.buttonText,
    required this.svgPath,
    required this.onTap,
    this.textStyle,
    this.buttonColor,
    this.borderRadius,
    this.padding,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: buttonColor ?? context.theme.mainAppColor,
        borderRadius: borderRadius ??
            const BorderRadius.all(
              Radius.circular(CommonDimensions.small),
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
