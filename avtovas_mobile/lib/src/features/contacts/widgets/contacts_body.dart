import 'package:avtovas_mobile/src/features/contacts/utils/constants/colors.dart'
as contacts_colors;
import 'package:avtovas_mobile/src/features/contacts/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  String getDate(BuildContext context) {
    final from = context.locale.from;
    const startTime = '05:00';
    final to = context.locale.to;
    const endTime = '20:00';
    final daily = context.locale.daily;
    final date = '$from $startTime $to $endTime $daily';
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          left: Dimensions.contactsPaddingLeft,
          top: Dimensions.contactsPaddingTop,),
      child: ListView(
        children: [
          Text(
            context.locale.infoDeskOfTheCentralBusStation,
            style: const TextStyle(
              color: contacts_colors.Colors.label,
              fontSize: Dimensions.labelFont,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Padding(
              padding:
              EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: contacts_colors.Colors.phone,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
              const EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: Text(
                getDate(context),
                style: const TextStyle(
                  color: contacts_colors.Colors.label,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(top: Dimensions.labelSectionMarginTop),
              child: Text(
                context.locale.controlRoomOfTheCentralBusStation,
                style: const TextStyle(
                  color: contacts_colors.Colors.label,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          const Padding(
              padding:
              EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: contacts_colors.Colors.phone,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(top: Dimensions.labelSectionMarginTop),
              child: Text(
                context.locale.support,
                style: const TextStyle(
                  color: contacts_colors.Colors.phone,
                  fontSize: Dimensions.titleFont,
                  fontWeight: FontWeight.w700,
                ),
              ),),
          const Padding(
              padding:
                EdgeInsets.only(top: Dimensions.labelSectionMarginTop),
              child: Text(
                '8 (800) 700-02-40',
                style: TextStyle(
                  color: contacts_colors.Colors.phone,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: Text(
                context.locale.roundTheClock,
                style: const TextStyle(
                  color: contacts_colors.Colors.label,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
            padding:
            const EdgeInsets.only(top: Dimensions.labelSectionMarginTop),
            child: Text(
              context.locale.contacts,
              style: const TextStyle(
                color: contacts_colors.Colors.phone,
                fontSize: Dimensions.titleFont,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const ContactsItem(),
          const ContactsItem(),
          const ContactsItem(),
          const ContactsItem(),
          const ContactsItem(),
        ],
      ),
    );
  }
}
