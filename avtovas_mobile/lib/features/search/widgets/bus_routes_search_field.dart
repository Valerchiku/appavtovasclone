import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/widgets/to_trip_selector.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'from_trip_selector.dart';
import 'package:common/src/utils/constants/images_assets.dart';

class BusRoutesSearchField extends StatelessWidget {
  final Function()? toggleRoutes;

  BusRoutesSearchField({super.key, required Function()? this.toggleRoutes});

  List<String> routes = ['Алатырь', 'Ардатов'];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimensions.fromTripSelectorMarginTop),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: FromTripSelectorWidget(routes: routes)),
            Align(
                alignment: Alignment.bottomLeft,
                child: ToTripSelectorWidget(routes: routes)),
            Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                    shape: CircleBorder(
                        side: BorderSide(
                            color: SearchColors.toggleBtnBorderColor,
                            width: Dimensions.toggleBtnBorder)),
                    onPressed: toggleRoutes,
                    child: AvtovasVectorImage(
                        svgAssetPath: ImagesAssets.toggleBtn),
                    backgroundColor: SearchColors.toggleBtnBackground))
          ],
        ),
        height: Dimensions.selectorHeight +
            Dimensions.selectorHeight +
            Dimensions.selectorMarginTop);
  }
}
