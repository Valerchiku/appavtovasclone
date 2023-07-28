import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:flutter/material.dart';

final class MainSearchBody extends StatelessWidget {
  const MainSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.mainSearchBackground,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
