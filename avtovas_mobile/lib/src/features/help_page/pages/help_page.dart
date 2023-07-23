import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/widgets/page_option_tile/page_option_tile.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

// ignore_for_file: avoid_returning_null_for_void
// ignore_for_file: implementation_imports

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.mainAppColor,
        leading: IconButton(
          onPressed: () => null,
          icon: const AvtovasVectorImage(
            svgAssetPath: AppAssets.backArrowIcon,
          ),
        ),
        title: Text(
          context.locale.help,
          style: context.themeData.textTheme.displaySmall?.copyWith(
            color: context.theme.whitespaceContainerColor,
            fontWeight: CommonFonts.weightRegular,
            fontSize: CommonFonts.appBarFontSize,
          ),
        ),
        centerTitle: false,
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
              onTap: () => null,
            ),
            PageOptionTile(
              title: context.locale.directory_info,
              onTap: () => null,
            ),
            PageOptionTile(
              title: context.locale.bus_station_contacts,
              onTap: () => null,
            ),
          ],
        ),
      ),
    );
  }
}
