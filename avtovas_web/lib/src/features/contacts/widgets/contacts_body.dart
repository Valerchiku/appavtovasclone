import 'package:avtovas_web/src/features/contacts/utils/contants/dimensions.dart';
import 'package:avtovas_web/src/features/contacts/utils/contants/fonts.dart';
import 'package:avtovas_web/src/features/contacts/widgets/contacts_item.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';

class ContactsPageBody extends StatelessWidget {
  const ContactsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(
          Dimensions.rootPadding
      ),
      children: [
        Text(
            '${context.locale.main} / ${context.locale.help} / ${context.locale.contacts}'
        ),
        Padding(
          padding: EdgeInsets.only(
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
              width: MediaQuery.of(context).size.width > Dimensions.minDesktopWidth ? MediaQuery.of(context).size.width / 2 - Dimensions.rootPadding * 2 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      context.locale.centralBusStationHelpline
                  ),
                  Text(
                    '+7 (8352) 28-90-00',
                    style: TextStyle(
                      color: context.theme.mainAppColor,
                      fontSize: Fonts.subtitleSize,
                      fontWeight: Fonts.phoneLabelWeight,
                    ),
                  ),
                  Text(
                    '${context.locale.from}'
                        ' 05:00 ${context.locale.to}'
                        ' 20:00 ${context.locale.daily}',
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Dimensions.controlRoomOfTheCentralBusStationPaddingTop,
                    ),
                    child: Text(
                        context.locale.controlRoomOfTheCentralBusStation
                    ),
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
              width: MediaQuery.of(context).size.width > Dimensions.minDesktopWidth ? MediaQuery.of(context).size.width / 2 - Dimensions.rootPadding * 2 : null,
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
                  Text(
                      context.locale.roundTheClock
                  ),
                  Padding(
                    padding: EdgeInsets.only(
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
                  ...List.generate(5, (index) => ContactsItem(),),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
