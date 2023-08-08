import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports
// ignore_for_file: prefer-match-file-name


class AboutBody extends StatelessWidget {
  const AboutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AvtovasVectorImage(
          svgAssetPath: AppAssets.logoVersion,
        ),
        Text(
          '${context.locale.version} 1.1',
        ),
      ],
    );
  }
}
