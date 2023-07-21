import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';

class RecentTripsHeaderWidget extends StatefulWidget {
  const RecentTripsHeaderWidget({super.key});

  @override
  State<RecentTripsHeaderWidget> createState() =>
      _RecentTripsHeaderWidgetState();
}

class _RecentTripsHeaderWidgetState extends State<RecentTripsHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(context.locale.recent,
                style: TextStyle(color: SearchColors.recentColor)),
            Container(
              child: AvtovasVectorImage(svgAssetPath: ImagesAssets.recentIcon),
              margin: EdgeInsets.only(left: Dimensions.recentIconMarginLeft),
            )
          ]),
          margin: EdgeInsets.only(top: Dimensions.recentMarginTop))
    ]);
  }
}
