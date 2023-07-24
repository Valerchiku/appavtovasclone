import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsHeaderWidget extends StatelessWidget {
  const RecentTripsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: Dimensions.recentMarginTop),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(context.locale.recent,
              style: const TextStyle(color: SearchColors.recentColor),),
          Container(
            margin: const EdgeInsets.only(left: Dimensions.recentIconMarginLeft),
            child: const AvtovasVectorImage(svgAssetPath: ImagesAssets.recentIcon),
          )
        ],),
      )
    ],);
  }
}
