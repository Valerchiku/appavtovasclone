import 'package:avtovas_web/src/features/help-info/widgets/help_info_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpInfoPage extends StatelessWidget {
  const HelpInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: HelpInfoPageBody(),
    );
  }
}
