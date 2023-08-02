import 'package:avtovas_web/src/features/passengers/widgets/passengers_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PassengersPageBody(
        passengers: [
          MockPassenger(fullName: 'fullName', seatOnTheBus: 'seatOnTheBus')
        ],
      ),
    );
  }
}
