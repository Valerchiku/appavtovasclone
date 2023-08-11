import 'package:avtovas_web/src/features/bus_station_contacts/utils/contants/dimensions.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/utils/contants/fonts.dart';
import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_contacts_item.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_utils.dart';
import 'package:flutter/cupertino.dart';

class BusStationContactsPageBody extends StatelessWidget {
  final List<MockContact> contacts;

  const BusStationContactsPageBody({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimensions.rootPadding),
      children: [
        Text(
          '${context.locale.main} / ${context.locale.help} / ${context.locale.contacts}',
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: Dimensions.titlePaddingBottom,
          ),
          child: Text(
            context.locale.contacts,
            style: context.themeData.textTheme.titleLarge?.copyWith(
              fontSize: Fonts.titleSize,
            ),
          ),
        ),
        Wrap(
          children: [
            SizedBox(
              width:
                  MediaQuery.of(context).size.width > Dimensions.minDesktopWidth
                      ? MediaQuery.of(context).size.width / 2 -
                          Dimensions.rootPadding * 2
                      : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.locale.centralBusStationHelpline),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: Fonts.subtitleSize,
                      fontWeight: Fonts.phoneLabelWeight,
                    ),
                  ),
                  Text(
                    context.locale.workTime,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimensions
                          .controlRoomOfTheCentralBusStationPaddingTop,
                    ),
                    child:
                        Text(context.locale.controlRoomOfTheCentralBusStation),
                  ),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: Fonts.subtitleSize,
                      fontWeight: Fonts.phoneLabelWeight,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width:
                  MediaQuery.of(context).size.width > Dimensions.minDesktopWidth
                      ? MediaQuery.of(context).size.width / 2 -
                          Dimensions.rootPadding * 2
                      : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.support,
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: Fonts.subtitleSize,
                      fontWeight: Fonts.subtitleWeight,
                    ),
                  ),
                  Text(
                    '8 (800) 700-02-40',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: Fonts.subtitleSize,
                      fontWeight: Fonts.phoneLabelWeight,
                    ),
                  ),
                  Text(context.locale.roundTheClock),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimensions.contactsLabelPaddingTop,
                    ),
                    child: Text(
                      context.locale.contacts,
                      style: TextStyle(
                        color: context.theme.mainAppColor,
                        fontSize: Fonts.subtitleSize,
                        fontWeight: Fonts.subtitleWeight,
                      ),
                    ),
                  ),
                  for (final contact in contacts)
                    ContactsItem(
                      title: contact.title,
                      phone: contact.phone,
                    ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
