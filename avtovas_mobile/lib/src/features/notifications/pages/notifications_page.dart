import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:avtovas_mobile/src/features/notifications/widgets/notifications_body.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseNavigationPage(
      body: NotificationsPageBody(),
    );
  }
}
