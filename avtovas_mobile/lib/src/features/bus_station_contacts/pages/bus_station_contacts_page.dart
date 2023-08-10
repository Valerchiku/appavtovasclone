import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/bus_station_contacts/widgets/bus_station_contacts_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BusStationContactsPage extends StatelessWidget {
  const BusStationContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.contactsTitle,
      body: const BusStationContactsPageBody(
        contacts: [],
      ),
    );
  }
}
