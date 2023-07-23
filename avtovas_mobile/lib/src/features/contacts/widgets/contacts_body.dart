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
            ),
            Text(
              '+7 (8352) 28-90-00',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${context.locale.from} 05:00 ${context.locale.to} 20:00 ${context.locale.daily}',
              style: TextStyle(
                color: ContactsColors.Colors.label,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${context.locale.control_room_of_the_central_bus_station}',
              style: TextStyle(
                color: ContactsColors.Colors.label,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '+7 (8352) 28-90-00',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${context.locale.support}',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.titleFont,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '8 (800) 700-02-40',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              context.locale.round_the_clock,
              style: TextStyle(
                color: ContactsColors.Colors.label,
                fontSize: Dimensions.labelFont,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '${context.locale.contacts}',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.titleFont,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              '${context.locale.contacts_item}',
              style: TextStyle(
                color: ContactsColors.Colors.phone,
                fontSize: Dimensions.titleFont,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ));
  }
}
