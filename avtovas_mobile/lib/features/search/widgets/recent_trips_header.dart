import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';

class RecentTripsHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(top: Dimensions.recentMarginTop),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(context.locale.recent,
              style: TextStyle(color: SearchColors.recentColor)),
          Container(
            margin: EdgeInsets.only(left: Dimensions.recentIconMarginLeft),
            child: AvtovasVectorImage(svgAssetPath: ImagesAssets.recentIcon),
          )
        ]),
      )
    ]);
  }
}
