import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContactsItem extends StatelessWidget {
  final String title;
  final String phone;

  const ContactsItem({
    required this.title,
    required this.phone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.mainAppColor,
            fontSize: WebFonts.titleFont,
          ),
        ),
        Text(
          phone,
          style: TextStyle(
            color: context.theme.secondaryTextColor,
            fontSize: WebFonts.labelFont,
            fontWeight: WebFonts.weightRegular,
          ),
        ),
      ],
    );
  }
}
