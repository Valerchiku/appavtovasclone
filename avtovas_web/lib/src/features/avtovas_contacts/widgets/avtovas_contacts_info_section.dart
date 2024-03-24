import 'package:avtovas_web/src/features/avtovas_contacts/widgets/avtovas_contacts_info_row.dart';
import 'package:avtovas_web/src/features/avtovas_contacts/widgets/section_tile.dart';
import 'package:flutter/material.dart';

class AvtovasContactsInfoSection extends StatelessWidget {
  final String title;
  final String firstSvgPath;
  final String secondSvgPath;
  final String firstLabel;
  final String secondLabel;

  const AvtovasContactsInfoSection({
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
        ContactsInfoRow(svgAssetPath: firstSvgPath, label: firstLabel),
        ContactsInfoRow(svgAssetPath: secondSvgPath, label: secondLabel),
      ],
    );
  }
}
