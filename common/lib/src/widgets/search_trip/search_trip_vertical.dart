import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTripVertical extends StatelessWidget {
  final List<String> items;
  final FocusNode? departureFocusNode;
  final FocusNode? arrivalFocusNode;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged onChangedArrival;
  final ValueChanged onChangedDeparture;
  final VoidCallback onPressed;

  const SearchTripVertical({
    required this.items,
    required this.arrivalController,
    required this.departureController,
    required this.onChangedArrival,
    required this.onChangedDeparture,
    required this.onPressed,
    this.departureFocusNode,
    this.arrivalFocusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchableMenu(
              focusNode: departureFocusNode,
              controller: departureController,
              items: items,
              onChanged: onChangedDeparture,
              hintText: context.locale.from,
            ),
            const SizedBox(height: CommonDimensions.large),
            SearchableMenu(
              focusNode: arrivalFocusNode,
              controller: arrivalController,
              items: items,
              onChanged: onChangedArrival,
              hintText: context.locale.to,
            ),
          ],
        ),
        Align(
          heightFactor: CommonDimensions.mobileHeightFactor,
          alignment: Alignment.centerRight,
          child: FloatingActionButton.small(
            backgroundColor: context.theme.whitespaceContainerColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(CommonDimensions.extraLarge),
              ),
            ),
            onPressed: onPressed,
            child: const AvtovasVectorImage(
              svgAssetPath: ImagesAssets.swapIcon,
            ),
          ),
        ),
      ],
    );
  }
}
