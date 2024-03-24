import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer-match-file-name
// ignore_for_file: directives_ordering
// ignore_for_file: implementation_imports

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontSize: WebFonts.detailsDescSize,
        color: context.theme.mainAppColor,
        fontWeight: WebFonts.weightBold,
      ),
    );
  }
}
