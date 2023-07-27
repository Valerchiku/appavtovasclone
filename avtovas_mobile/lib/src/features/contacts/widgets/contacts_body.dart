import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/contacts/utils/constants/colors.dart'
    as contacts_colors;
import 'package:avtovas_mobile/src/features/contacts/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  String getDate(BuildContext context) {
    String from = context.locale.from;
    String startTime = '05:00';
    String to = context.locale.to;
    String endTime = '20:00';
    String daily = context.locale.daily;
    String date = '${from} ${startTime} ${to} ${endTime} ${daily}';
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
            context.locale.info_desk_of_the_central_bus_station,
            style: const TextStyle(
              color: contacts_colors.Colors.label,
              fontSize: Dimensions.labelFont,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Padding(
              padding:
              const EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: const Text(
                '+7 (8352) 28-90-00',
                style: const TextStyle(
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
                context.locale.control_room_of_the_central_bus_station,
                style: const TextStyle(
                  color: contacts_colors.Colors.label,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          const Padding(
              padding:
              const EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: const Text(
                '+7 (8352) 28-90-00',
                style: const TextStyle(
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
                const EdgeInsets.only(top: Dimensions.labelSectionMarginTop),
              child: const Text(
                '8 (800) 700-02-40',
                style: const TextStyle(
                  color: contacts_colors.Colors.phone,
                  fontSize: Dimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              )),
          Padding(
              padding:
                const EdgeInsets.only(top: Dimensions.labelMarginTop),
              child: Text(
                context.locale.round_the_clock,
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
