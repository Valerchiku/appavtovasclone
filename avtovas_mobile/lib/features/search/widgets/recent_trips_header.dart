import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentTripsHeaderWidget extends StatelessWidget {
  const RecentTripsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: CommonDimensions.recentMarginTop),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(context.locale.recent,
              style: TextStyle(color: context.theme.recentColor),),
          Container(
            margin: const EdgeInsets.only(left: CommonDimensions.recentIconMarginLeft),
            child: const AvtovasVectorImage(svgAssetPath: ImagesAssets.recentIcon),
          )
        ],),
      )
    ],);
  }
}
