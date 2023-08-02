import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContactsPageBody extends StatelessWidget {
  final List<MockContact> contacts;

  const ContactsPageBody({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Text(
          context.locale.infoDeskOfTheCentralBusStation,
          style: TextStyle(
            color: context.theme.secondaryTextColor,
            fontSize: AppFonts.labelFont,
            fontWeight: AppFonts.labelFontWeight,
          ),
        ),
        ...<Widget>[
          Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
          Text(
            context.locale.workTime,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
          Text(
            context.locale.controlRoomOfTheCentralBusStation,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
          Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
          Text(
            context.locale.support,
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.titleFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
          Text(
            '8 (800) 700-02-40',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
          Text(
            context.locale.roundTheClock,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
          Text(
            context.locale.contacts,
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.titleFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ].insertBetween(
          const SizedBox(height: AppDimensions.large),
        ),
        for (final contact in contacts)
          ContactsItem(
            title: contact.title,
            phone: contact.phone,
          ),
      ],
    );
  }
}
