import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContactsItem extends StatelessWidget {
  const ContactsItem({super.key});

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
                fontSize: AppFonts.titleFont,
            ),
          ),
        ),
        SizedBox(
            child: Text(
              '8 (8352) 28-90-00',
              style: TextStyle(
                color: context.theme.secondaryTextColor,
                fontSize: AppFonts.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),),
      ],
    );
  }
}
