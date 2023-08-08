import 'package:avtovas_mobile/src/features/contacts/widgets/contacts_info_row.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/section_tile.dart';
import 'package:flutter/material.dart';

class ContactsInfoSection extends StatelessWidget {
  final String title;
  final String firstSvgPath;
  final String secondSvgPath;
  final String firstLabel;
  final String secondLabel;

  const ContactsInfoSection({
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
        ContactsInfoRow(svgAssetPath: secondLabel, label: secondLabel),
      ],
    );
  }
}
