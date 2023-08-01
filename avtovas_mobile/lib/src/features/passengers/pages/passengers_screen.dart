import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_screen_body.dart';
import 'package:flutter/material.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationPage(
      body: PassengersScreenBody(),
    );
  }
}
