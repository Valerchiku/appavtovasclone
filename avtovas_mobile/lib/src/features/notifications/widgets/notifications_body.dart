import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/base_navigation_page/base_navigation_page.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class NotificationsPageBody extends StatefulWidget {
  const NotificationsPageBody({super.key});

  @override
  State<NotificationsPageBody> createState() => _NotificationsPageBodyState();
}

class _NotificationsPageBodyState extends State<NotificationsPageBody> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(
        left: AppDimensions.large,
        right: AppDimensions.large,
        top: AppDimensions.large,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.locale.sendPushNotificationsBeforeRace,
              style: context.themeData.textTheme.titleLarge,
            ),
            Switch(
              value: true,
              onChanged: (val) {
                // TODO gleb_dyakov: implementation.
              },
            )
          ],
        )
      ],
    );
  }
}
