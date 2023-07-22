import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/widgets/bus_routes_search_field.dart';
import 'package:avtovas_mobile/features/search/widgets/clear_recent_trips.dart';
import 'package:avtovas_mobile/features/search/widgets/filters.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trips.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trips_header.dart';
import 'package:avtovas_mobile/features/search/widgets/title.dart';
import 'package:common/src/utils/constants/images_assets.dart';

class SearchPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
            left: Dimensions.rootPaddingHorizontal,
            right: Dimensions.rootPaddingHorizontal,
            top: Dimensions.rootPaddingTop,
            bottom: Dimensions.rootPaddingBottom),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('./assets/images/background.png'))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvtovasVectorImage(
                  svgAssetPath: ImagesAssets.logoWhite,
                  width: Dimensions.logoWidth,
                  height: Dimensions.logoHeight),
              Container(
                  child: Column(children: [
                TitleWidget(),
                BusRoutesSearchField(toggleRoutes: () {
                  // TODO
                }),
                FiltersWidget(),
                RecentTripsHeaderWidget(),
                RecentTripsWidget(),
                ClearRecentTripsWidget()
              ]))
            ]));
  }
}
