import 'package:avtovas_web/src/features/passengers/widgets/passengers_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const PassengersPageBody(),
    );
  }
}
