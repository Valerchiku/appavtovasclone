// ignore: implementation_imports
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/help_info/widgets/help_info_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class HelpInfoPage extends StatelessWidget {
  const HelpInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.help,
      body: const HelpInfoPageBody(),
    );
  }
}
