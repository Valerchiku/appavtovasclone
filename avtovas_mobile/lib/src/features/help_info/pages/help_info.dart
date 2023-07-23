import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/help_info_body.dart';

class HelpInfoPage extends StatelessWidget {
  const HelpInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HelpInfoPageBody(),
    );
  }
}