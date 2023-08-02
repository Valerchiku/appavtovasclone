import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class NotificationsPageBody extends StatelessWidget {
  const NotificationsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppDimensions.large,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.locale.sendPushNotificationsBeforeRace,
            style: context.themeData.textTheme.titleLarge,
          ),
          Switch(
            trackColor: MaterialStateProperty.all<Color>(
              context.theme.switchTrack,
            ),
            value: true,
            onChanged: (val) {
              // ignore: flutter_style_todos
              // TODO gleb_dyakov: implementation.
            },
          )
        ],
      ),
    );
  }
}
