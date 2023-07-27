import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/widgets/avtovas_app_bar/avtovas_app_bar.dart';
import 'package:avtovas_mobile/src/common/widgets/page_option_tile/page_option_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

// ignore_for_file: implementation_imports

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
          horizontal: CommonDimensions.large,
          vertical: CommonDimensions.large,
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
