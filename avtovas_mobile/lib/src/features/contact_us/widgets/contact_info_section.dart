import 'package:avtovas_mobile/src/features/contact_us/widgets/contact_info_row.dart';
import 'package:avtovas_mobile/src/features/contact_us/widgets/section_tile.dart';
import 'package:flutter/material.dart';

class ContactInfoSection extends StatelessWidget {
  final String title;
  final String firstSvgPath;
  final String secondSvgPath;
  final String firstLabel;
  final String secondLabel;

  const ContactInfoSection({
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
        ContactInfoRow(svgAssetPath: firstSvgPath, label: firstLabel),
        ContactInfoRow(svgAssetPath: secondLabel, label: secondLabel),
      ],
    );
  }
}
