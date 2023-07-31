import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvtovasVectorImage(
            svgAssetPath: ImagesAssets.logoVersion,
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
