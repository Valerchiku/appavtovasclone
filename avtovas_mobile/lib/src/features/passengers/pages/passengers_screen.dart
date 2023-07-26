import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/common/widgets/navigation_panel/avtovas_navigation_panel.dart';
import 'package:avtovas_mobile/src/features/app/pages/app.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/item.dart';
import 'package:avtovas_mobile/src/features/passengers/widgets/passengers_screen_body.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassengersScreen extends StatelessWidget {
  const PassengersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AvtovasNavigationPanel(
        selectedIndex: -1, items: [],
      ),
      body: PassengersScreenBody(),
    );
  }
}
