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
  final Color? iconColor;
  final double? sizeBetween;
  final bool isActive;
  final double? backgroundOpacity;

  const AvtovasButton.text({
    required this.buttonText,
    required this.onTap,
    this.isActive = true,
    this.textStyle,
    this.buttonColor,
    this.backgroundOpacity,
    this.borderRadius,
    this.padding,
    this.margin,
    super.key,
  })  : svgPath = null,
        iconColor = null,
        sizeBetween = null;

  const AvtovasButton.icon({
    required this.buttonText,
    required this.svgPath,
    required this.onTap,
    this.isActive = true,
    this.textStyle,
    this.iconColor,
    this.sizeBetween,
    this.buttonColor,
    this.backgroundOpacity,
    this.borderRadius,
    this.padding,
    this.margin,
    super.key,
  });

  Color _backgroundWithOpacity(BuildContext context) {
    const activeOpacity = 1.0;
    const inactiveOpacity = 0.8;

    return backgroundOpacity == null
        ? buttonColor?.withOpacity(
              isActive ? activeOpacity : inactiveOpacity,
            ) ??
            context.theme.mainAppColor.withOpacity(
              isActive ? activeOpacity : inactiveOpacity,
            )
        : buttonColor?.withOpacity(
              backgroundOpacity!,
            ) ??
            context.theme.mainAppColor.withOpacity(backgroundOpacity!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Material(
        color: _backgroundWithOpacity(context),
        borderRadius: borderRadius ??
            const BorderRadius.all(
              Radius.circular(CommonDimensions.small),
            ),
        child: InkWell(
          onTap: isActive ? onTap : null,
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
                            color: isActive
                                ? context.theme.whiteTextColor
                                : context.theme.fivefoldTextColor,
                          ),
                    )
                  : Row(
                      children: [
                        AvtovasVectorImage(
                          svgAssetPath: svgPath!,
                          color: iconColor,
                        ),
                        SizedBox(
                          width: sizeBetween ?? CommonDimensions.large,
                        ),
                        Text(
                          buttonText,
                          style: textStyle ??
                              context.themeData.textTheme.titleLarge?.copyWith(
                                color: isActive
                                    ? context.theme.whiteTextColor
                                    : context.theme.fivefoldTextColor,
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
