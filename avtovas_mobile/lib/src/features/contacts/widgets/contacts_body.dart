import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/contacts/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/contacts/utils/constants/colors.dart'
    as ContactsColors;

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: Dimensions.contactsPaddingLeft,
            top: Dimensions.contactsPaddingTop),
        child: Column(
          children: [
            Text(
              context.locale.info_desk_of_the_central_bus_station,
              style: TextStyle(
                color: ContactsColors.Colors.label,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
  }
}
