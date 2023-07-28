// ignore: implementation_imports
import 'package:avtovas_mobile/src/features/help_info/widgets/help_info_body.dart';
import 'package:flutter/material.dart';

class HelpInfoPage extends StatelessWidget {
  const HelpInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HelpInfoPageBody(),
    );
  }
}
