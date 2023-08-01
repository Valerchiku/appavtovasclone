import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
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
          const AvtovasVectorImage(
            svgAssetPath: ImagesAssets.logoVersion,
          ),
          SizedBox(
            child: Text(
              '${context.locale.version} 1.1',
            ),
          ),
        ],
      ),
    );
  }
}
