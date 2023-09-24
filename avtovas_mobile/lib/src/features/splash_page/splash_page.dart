import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.mainAppColor,
      body: const Center(
        child: AvtovasVectorImage(
          svgAssetPath: AppAssets.mainActovasLogo,
        ),
      ),
    );
  }
}
