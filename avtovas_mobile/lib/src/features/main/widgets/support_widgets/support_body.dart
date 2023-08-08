import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

final class SupportBody extends StatelessWidget {
  const SupportBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
        vertical: AppDimensions.large,
      ),
      child: Column(
        children: [
          PageOptionTile(
            title: context.locale.inquiry,
            onTap: () {},
          ),
          PageOptionTile(
            title: context.locale.directoryInfo,
            onTap: () {},
          ),
          PageOptionTile(
            title: context.locale.busStationContacts,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
