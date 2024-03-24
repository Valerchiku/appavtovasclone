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
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Spacer(),
              const AvtovasVectorImage(
                svgAssetPath: AppAssets.logoVersion,
              ),
              const SizedBox(height: AppDimensions.large),
              Text('${context.locale.version} 1.0'),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}
