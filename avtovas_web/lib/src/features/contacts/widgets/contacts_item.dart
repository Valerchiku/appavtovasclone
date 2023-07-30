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
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          child: Text(
            '8 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),),
      ],
    );
  }
}
