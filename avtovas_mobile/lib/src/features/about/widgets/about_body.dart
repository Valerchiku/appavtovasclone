import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

// ignore: implementation_imports
// ignore_for_file: prefer-match-file-name


class AboutBody extends StatelessWidget {
  const AboutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.availableWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AvtovasVectorImage(
            svgAssetPath: AppAssets.logoVersion,
          ),
          Text(
            '${context.locale.version} 1.1',
          ),
        ],
      ),
    );
  }
}
