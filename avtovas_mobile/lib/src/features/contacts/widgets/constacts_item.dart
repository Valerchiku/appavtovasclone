import 'package:avtovas_mobile/src/features/contacts/utils/constants/colors.dart'
  as contacts_colors;
import 'package:avtovas_mobile/src/features/contacts/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsItem extends StatelessWidget {
  const ContactsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Dimensions.contactsItemTitleMarginTop,
          ),
          child: Text(
            context.locale.contactsItem,
            style: const TextStyle(
              color: contacts_colors.Colors.phone,
              fontSize: Dimensions.titleFont,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(
              top: Dimensions.contactsItemLabelMarginTop,
            ),
            child: Text(
              '8 (8352) 28-90-00',
              style: TextStyle(
                color: contacts_colors.Colors.label,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),),
      ],
    );
  }
}
