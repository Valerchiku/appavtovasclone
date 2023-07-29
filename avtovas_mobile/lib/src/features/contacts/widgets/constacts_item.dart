import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
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
            top: AppDimensions.contactsItemTitleMarginTop,
          ),
          child: Text(
            context.locale.contactsItem,
            style: TextStyle(
              color: context.theme.phone,
              fontSize: AppDimensions.titleFont,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.contactsItemLabelMarginTop,
            ),
            child: Text(
              '8 (8352) 28-90-00',
              style: TextStyle(
                color: context.theme.label,
                fontSize: AppDimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),),
      ],
    );
  }
}
