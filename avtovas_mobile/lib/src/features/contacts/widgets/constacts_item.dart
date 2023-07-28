import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
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
            top: CommonDimensions.contactsItemTitleMarginTop,
          ),
          child: Text(
            context.locale.contactsItem,
            style: TextStyle(
              color: context.theme.phone,
              fontSize: CommonDimensions.titleFont,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: CommonDimensions.contactsItemLabelMarginTop,
            ),
            child: Text(
              '8 (8352) 28-90-00',
              style: TextStyle(
                color: context.theme.label,
                fontSize: CommonDimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),),
      ],
    );
  }
}
