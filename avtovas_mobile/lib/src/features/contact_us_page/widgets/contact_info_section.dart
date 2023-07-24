import 'package:avtovas_mobile/src/features/contact_us_page/widgets/contact_info_row.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/section_tile.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class ContactInfoSection extends StatelessWidget {
  final String title;
  final String svgAssetPath;
  final String svgAssetPath2;
  final String label;
  final String label2;

  const ContactInfoSection({
    required this.title,
    required this.svgAssetPath,
    required this.svgAssetPath2,
    required this.label,
    required this.label2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        ContactInfoRow(svgAssetPath: svgAssetPath, label: label),
        ContactInfoRow(svgAssetPath: svgAssetPath2, label: label2),
      ],
    );
  }
}
