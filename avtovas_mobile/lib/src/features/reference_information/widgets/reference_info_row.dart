import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class ReferenceInfoRow extends StatelessWidget {
  final String svgAssetPath;
  final String label;

  const ReferenceInfoRow({
    required this.svgAssetPath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimensions.medium),
      child: Row(
        children: [
          AvtovasVectorImage(svgAssetPath: svgAssetPath),
          const SizedBox(width: AppDimensions.large),
          Text(
            label,
            style: context.themeData.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
