import 'package:avtovas_web/src/common/utils/constants/web_fonts.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:flutter/material.dart';

class ContactsItem extends StatelessWidget {
  final String title;
  final String phone;

  const ContactsItem({required this.title, required this.phone, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(
            context.locale.contactsItem,
            style: context.themeData.textTheme.headlineLarge?.copyWith(
              color: context.theme.mainAppColor,
              fontSize: WebFonts.sizeHeadlineMedium,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            phone,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: WebFonts.sizeHeadlineMedium,
              fontWeight: WebFonts.phoneFontWeight,
            ),
          ),
        ),
      ],
    );
  }
}
