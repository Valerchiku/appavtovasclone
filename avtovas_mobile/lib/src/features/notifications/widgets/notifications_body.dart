import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class NotificationsPageBody extends StatelessWidget {
  const NotificationsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: AppDimensions.large,
        right: AppDimensions.large,
        top: AppDimensions.large,
        bottom: AppDimensions.large,
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
                // ignore: flutter_style_todos
                // TODO gleb_dyakov: implementation.
              },
            )
          ],
        )
      ],
    );
  }
}
