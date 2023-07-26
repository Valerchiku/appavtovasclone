import 'package:avtovas_mobile/features/search/widgets/bus_routes_search_field.dart';
import 'package:avtovas_mobile/features/search/widgets/clear_recent_trips.dart';
import 'package:avtovas_mobile/features/search/widgets/filters.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trips.dart';
import 'package:avtovas_mobile/features/search/widgets/recent_trips_header.dart';
import 'package:avtovas_mobile/features/search/widgets/title.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      width: double.infinity,
      height: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height
          : null,
      padding: const EdgeInsets.only(
          left: CommonDimensions.rootPaddingHorizontal,
          right: CommonDimensions.rootPaddingHorizontal,
          top: CommonDimensions.rootPaddingTop,
          bottom: CommonDimensions.rootPaddingBottom,),
      decoration: const BoxDecoration(
          image: const DecorationImage(
              fit: BoxFit.fitWidth,
              image: const AssetImage(ImagesAssets.background),),),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const AvtovasVectorImage(
            svgAssetPath: ImagesAssets.logoWhite,
            width: CommonDimensions.logoWidth,
            height: CommonDimensions.logoHeight,),
        Column(children: [
          TitleWidget(),
          BusRoutesSearchField(toggleRoutes: () {
            // TODO(gleb_dyakov): implementation.
          },),
          FiltersWidget(),
          RecentTripsHeaderWidget(),
          RecentTripsWidget(),
          ClearRecentTripsWidget()
        ],),
      ],),
    ),);
  }
}
