import 'package:avtovas_mobile/src/features/contact_us_page/widgets/contact_info_row.dart';
import 'package:avtovas_mobile/src/features/contact_us_page/widgets/section_tile.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

class ContactInfoSection extends StatelessWidget {
  final String title;
  final Widget icon;
  final Widget icon_2;
  final String label;
  final String label_2;

  const ContactInfoSection({
    required this.title,
    required this.icon,
    required this.icon_2,
    required this.label,
    required this.label_2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        const SizedBox(height: CommonDimensions.large),
        ContactInfoRow(icon: icon, label: label),
        const SizedBox(height: CommonDimensions.medium),
        ContactInfoRow(icon: icon_2, label: label_2),
      ],
    );
  }
}
