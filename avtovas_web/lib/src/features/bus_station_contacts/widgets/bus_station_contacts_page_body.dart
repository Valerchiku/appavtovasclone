import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/utils/web_mock_contact.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_contacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BusStationContactsPageBody extends StatelessWidget {
  final List<WebMockContact> contacts;

  const BusStationContactsPageBody({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppDimensions.large,
          ),
          child: Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.busStationContacts}',
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.large,
          ),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.large,
                ),
                child: Text(
                  context.locale.busStationContacts,
                  style: context.themeData.textTheme.titleLarge?.copyWith(
                    fontSize: AppFonts.extraLarge,
                    fontWeight: AppFonts.titleWeight,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.locale.infoDeskOfTheCentralBusStation,
                  style: TextStyle(
                    color: context.theme.secondaryTextColor,
                    fontSize: AppFonts.titleSize,
                    fontWeight: AppFonts.normalWeight,
                  ),
                ),
                ...<Widget>[
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    context.locale.workTime,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    context.locale.controlRoomOfTheCentralBusStation,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    context.locale.support,
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    '8 (800) 700-02-40',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                  Text(
                    context.locale.roundTheClock,
                    style: TextStyle(
                      color: context.theme.secondaryTextColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.normalWeight,
                    ),
                  ),
                ]
              ]
                .insertBetween(
                  const SizedBox(height: AppDimensions.large),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.availableWidth / 4.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.contacts,
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: AppFonts.titleSize,
                      fontWeight: AppFonts.titleWeight,
                    ),
                  ),
                  for (final contact in contacts)
                    BusStationContactsItem(
                      title: contact.title,
                      address: contact.address,
                      phone: contact.phone,
                    ),
                ]
              )
            )
          ],
        ),
      ],
    );
  }
}
