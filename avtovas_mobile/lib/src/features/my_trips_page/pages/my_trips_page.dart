import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/my_trips_page/widgets/my_trips_body.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:flutter/material.dart';

class MyTripsPage extends StatelessWidget {
  const MyTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      appBarTitle: context.locale.myTrips,
      body: const MyTripsBody(),
    );
  }
}
