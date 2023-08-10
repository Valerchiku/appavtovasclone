import 'package:avtovas_web/src/features/bus_station_contacts/widgets/bus_station_contacts_body.dart';
import 'package:flutter/material.dart';

class BusStationContactsPage extends StatelessWidget {
  const BusStationContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BusStationContactsPageBody(
        contacts: [],
      ),
    );
  }
}
