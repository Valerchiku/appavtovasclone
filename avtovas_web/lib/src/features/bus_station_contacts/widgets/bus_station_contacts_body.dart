import 'package:avtovas_web/src/common/constants/web_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_constacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BusStationContactsBody extends StatelessWidget {
  final bool smartLayout;
  final bool mobileLayout;
  final List<MockContact> contacts;

  const BusStationContactsBody({
    required this.smartLayout,
    required this.mobileLayout,
    required this.contacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(
        smartLayout ? WebDimensions.large : WebDimensions.extraLarge,
      ),
      children: [
        Text(
          'Контакты автовокзалов',
          style: context.themeData.textTheme.displayMedium,
        ),
        if (!mobileLayout)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: WebDimensions.large),
                  Text(
                    context.locale.infoDeskOfTheCentralBusStation,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    context.locale.workTime,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    context.locale.controlRoomOfTheCentralBusStation,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    context.locale.support,
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: WebFonts.titleFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    '8 (800) 700-02-40',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  Text(
                    context.locale.roundTheClock,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: WebFonts.labelFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.contacts,
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: WebFonts.titleFont,
                      fontWeight: WebFonts.weightRegular,
                    ),
                  ),
                  for (final contact in contacts)
                    ContactsItem(
                      title: contact.title,
                      phone: contact.phone,
                    ),
                ],
              ),
            ],
          ),
        if (mobileLayout)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.infoDeskOfTheCentralBusStation,
                style: TextStyle(
                  color: context.theme.secondaryTextColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: context.theme.mainAppColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                context.locale.workTime,
                style: TextStyle(
                  color: context.theme.secondaryTextColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                context.locale.controlRoomOfTheCentralBusStation,
                style: TextStyle(
                  color: context.theme.secondaryTextColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                '+7 (8352) 28-90-00',
                style: TextStyle(
                  color: context.theme.mainAppColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                context.locale.support,
                style: TextStyle(
                  color: context.theme.mainAppColor,
                  fontSize: WebFonts.titleFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                '8 (800) 700-02-40',
                style: TextStyle(
                  color: context.theme.mainAppColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                context.locale.roundTheClock,
                style: TextStyle(
                  color: context.theme.secondaryTextColor,
                  fontSize: WebFonts.labelFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              Text(
                context.locale.contacts,
                style: TextStyle(
                  color: context.theme.mainAppColor,
                  fontSize: WebFonts.titleFont,
                  fontWeight: WebFonts.weightRegular,
                ),
              ),
              // const Spacer(),
            ],
          ),
      ],
    );
  }
}
