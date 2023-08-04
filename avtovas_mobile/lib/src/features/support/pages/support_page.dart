import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AvtovasAppBar(
        title: context.locale.help,
        svgAssetPath: AppAssets.backArrowIcon,
        onTap: () {},
      ),
      body: Padding(
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
      ),
    );
  }
}
