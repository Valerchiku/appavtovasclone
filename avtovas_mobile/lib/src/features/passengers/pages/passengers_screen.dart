import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_screen_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.passengersTitle,
      body: const PassengersScreenBody(),
    );
  }
}
