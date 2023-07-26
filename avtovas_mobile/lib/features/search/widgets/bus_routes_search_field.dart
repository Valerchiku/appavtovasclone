import 'from_trip_selector.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:avtovas_mobile/features/search/widgets/to_trip_selector.dart';
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

final class BusRoutesSearchField extends StatelessWidget {
  final Function()? toggleRoutes;

  BusRoutesSearchField({required this.toggleRoutes, super.key});

  List<String> routes = ['Алатырь', 'Ардатов'];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: CommonDimensions.fromTripSelectorMarginTop),
        height: CommonDimensions.selectorHeight +
            CommonDimensions.selectorHeight +
            CommonDimensions.selectorMarginTop,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: FromTripSelectorWidget(routes: routes),),
            Align(
                alignment: Alignment.bottomLeft,
                child: ToTripSelectorWidget(routes: routes),),
            Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                    shape: CircleBorder(
                        side: BorderSide(
                            color: context.theme.toggleBtnBorderColor,
                            width: CommonDimensions.toggleBtnBorder,),),
                    onPressed: toggleRoutes,
                    backgroundColor: context.theme.toggleBtnBackground,
                    child: const AvtovasVectorImage(
                        svgAssetPath: ImagesAssets.toggleBtn,),),)
          ],
        ),);
  }
}
