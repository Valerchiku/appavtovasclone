import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreButton extends StatelessWidget {
  final String svgPath;
  final String storeName;
  final VoidCallback onTap;

  const StoreButton({
    required this.svgPath,
    required this.storeName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 40,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        color: Colors.black,
        onPressed: onTap,
        child: Row(
          children: [
            const SizedBox(width: AppDimensions.medium),
            SvgPicture.asset(svgPath, width: 24, height: 24),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Доступно в',
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: 12,
                    color: context.theme.whiteTextColor,
                  ),
                ),
                Text(
                  storeName,
                  style: context.themeData.textTheme.bodyLarge?.copyWith(
                    fontSize: 14,
                    color: context.theme.whiteTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppDimensions.medium),
          ],
        ),
      ),
    );
  }
}