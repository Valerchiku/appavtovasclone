import 'package:avtovas_mobile/src/features/contacts/widgets/constacts_item.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/common_dimensions.dart';
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
          left: CommonDimensions.contactsPaddingLeft,
          top: CommonDimensions.contactsPaddingTop,),
      child: ListView(
        children: [
          Text(
            context.locale.infoDeskOfTheCentralBusStation,
            style: TextStyle(
              color: context.theme.label,
              fontSize: CommonDimensions.labelFont,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
              padding:
              const EdgeInsets.only(
                  top: CommonDimensions.labelMarginTop,
              ),
              child: Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: context.theme.phone,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
              const EdgeInsets.only(top: CommonDimensions.labelMarginTop),
              child: Text(
                getDate(context),
                style: TextStyle(
                  color: context.theme.label,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(
                    top: CommonDimensions.labelSectionMarginTop,
                ),
              child: Text(
                context.locale.controlRoomOfTheCentralBusStation,
                style: TextStyle(
                  color: context.theme.label,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
              const EdgeInsets.only(
                  top: CommonDimensions.labelMarginTop,
              ),
              child: Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: context.theme.phone,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(
                    top: CommonDimensions.labelSectionMarginTop,
                ),
              child: Text(
                context.locale.support,
                style: TextStyle(
                  color: context.theme.phone,
                  fontSize: CommonDimensions.titleFont,
                  fontWeight: FontWeight.w700,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(
                    top: CommonDimensions.labelSectionMarginTop,
                ),
              child: Text(
                '8 (800) 700-02-40',
                style: TextStyle(
                  color: context.theme.phone,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
              padding:
                const EdgeInsets.only(top: CommonDimensions.labelMarginTop),
              child: Text(
                context.locale.roundTheClock,
                style: TextStyle(
                  color: context.theme.label,
                  fontSize: CommonDimensions.labelFont,
                  fontWeight: FontWeight.w400,
                ),
              ),),
          Padding(
            padding:
            const EdgeInsets.only(top: CommonDimensions.labelSectionMarginTop),
            child: Text(
              context.locale.contacts,
              style: TextStyle(
                color: context.theme.phone,
                fontSize: CommonDimensions.titleFont,
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
