import 'package:avtovas_mobile/src/features/reference_information/widgets/reference_info_row.dart';
import 'package:avtovas_mobile/src/features/reference_information/widgets/section_tile.dart';
import 'package:flutter/material.dart';

class ReferenceInfoSection extends StatelessWidget {
  final String title;
  final String firstSvgPath;
  final String secondSvgPath;
  final String firstLabel;
  final String secondLabel;

  const ReferenceInfoSection({
    required this.title,
    required this.firstSvgPath,
    required this.secondSvgPath,
    required this.firstLabel,
    required this.secondLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        ReferenceInfoRow(svgAssetPath: firstSvgPath, label: firstLabel),
        ReferenceInfoRow(svgAssetPath: secondLabel, label: secondLabel),
      ],
    );
  }
}
