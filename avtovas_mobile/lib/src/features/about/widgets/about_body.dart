import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

// ignore_for_file: always_use_package_imports

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AvtovasVectorImage(
            svgAssetPath: const ImagesAssets.logoVersion,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimensions.large,
            ),
            child: Text(
                '${context.locale.version} 1.1',
            ),
          ),
        ],
      ),
    );
  }
}
