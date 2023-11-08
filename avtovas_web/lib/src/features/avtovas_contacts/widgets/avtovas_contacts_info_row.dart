import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContactsInfoRow extends StatelessWidget {
  final String svgAssetPath;
  final String label;

  const ContactsInfoRow({
    required this.svgAssetPath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: WebDimensions.medium),
      child: Row(
        children: [
          AvtovasVectorImage(svgAssetPath: svgAssetPath),
          const SizedBox(width: WebDimensions.large),
          Text(
            label,
            style: context.themeData.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
