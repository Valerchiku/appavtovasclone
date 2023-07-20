import 'package:common/src/theme/theme_extension.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

final class AvtovasBuyButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;

  const AvtovasBuyButton({
    required this.buttonText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.mainAppColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(CommonDimensions.small),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(CommonDimensions.small),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: CommonDimensions.large,
            vertical: CommonDimensions.medium,
          ),
          child: Text(
            buttonText,
            style: context.themeData.textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
