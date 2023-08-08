import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

final class ProfileButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final String svgPath;

  const ProfileButton({
    required this.onTap,
    required this.buttonText,
    required this.svgPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.large),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.medium,
            vertical: AppDimensions.mediumLarge,
          ),
          child: Row(
            children: [
              SizedBox(
                width: AppDimensions.preExtraLarge,
                child: Center(
                  child: AvtovasVectorImage(svgAssetPath: svgPath),
                ),
              ),
              const SizedBox(width: AppDimensions.large),
              Text(
                buttonText,
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
