import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: AppDimensions.large,
        top: AppDimensions.large,
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
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.medium,
          ),
          child: Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.medium),
          child: Text(
            context.locale.workTime,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            context.locale.controlRoomOfTheCentralBusStation,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.medium,
          ),
          child: Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            context.locale.support,
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.titleFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '8 (800) 700-02-40',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.medium),
          child: Text(
            context.locale.roundTheClock,
            style: TextStyle(
              color: context.theme.secondaryTextColor,
              fontSize: AppFonts.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: AppDimensions.large),
          child: Text(
            context.locale.contacts,
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: AppFonts.titleFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        const ContactsItem(),
        const ContactsItem(),
        const ContactsItem(),
        const ContactsItem(),
        const ContactsItem(),
      ],
    );
  }
}
