import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';
import 'package:common/avtovas_common.dart';
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
    return ListView(
      padding: const EdgeInsets.only(
        left: AppDimensions.contactsPaddingLeft,
        top: AppDimensions.contactsPaddingTop,
      ),
      children: [
        Text(
          context.locale.infoDeskOfTheCentralBusStation,
          style: TextStyle(
            color: context.theme.label,
            fontSize: AppDimensions.labelFont,
            fontWeight: AppFonts.labelFontWeight,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.labelMarginTop,
          ),
          child: Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.phone,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.labelMarginTop),
          child: Text(
            '${context.locale.from}'
            ' 05:00 ${context.locale.to}'
            ' 20:00 ${context.locale.daily}',
            style: TextStyle(
              color: context.theme.label,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.labelSectionMarginTop,
          ),
          child: Text(
            context.locale.controlRoomOfTheCentralBusStation,
            style: TextStyle(
              color: context.theme.label,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.labelMarginTop,
          ),
          child: Text(
            '+7 (8352) 28-90-00',
            style: TextStyle(
              color: context.theme.phone,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.labelSectionMarginTop,
          ),
          child: Text(
            context.locale.support,
            style: TextStyle(
              color: context.theme.phone,
              fontSize: AppFonts.titleFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppDimensions.labelSectionMarginTop,
          ),
          child: Text(
            '8 (800) 700-02-40',
            style: TextStyle(
              color: context.theme.phone,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.phoneFontWeight,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppDimensions.labelMarginTop),
          child: Text(
            context.locale.roundTheClock,
            style: TextStyle(
              color: context.theme.label,
              fontSize: AppDimensions.labelFont,
              fontWeight: AppFonts.labelFontWeight,
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: AppDimensions.labelSectionMarginTop),
          child: Text(
            context.locale.contacts,
            style: TextStyle(
              color: context.theme.phone,
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
