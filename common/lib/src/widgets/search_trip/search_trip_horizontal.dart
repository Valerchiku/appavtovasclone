import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTripHorizontal extends StatelessWidget {
  final UniqueKey departureUniqueKey;
  final UniqueKey arrivalUniqueKey;
  final List<String> firstItems;
  final List<String> secondItems;
  final FocusNode? departureFocusNode;
  final FocusNode? arrivalFocusNode;
  final TextEditingController departureController;
  final TextEditingController arrivalController;
  final VoidCallback onSwapButtonTap;
  final ValueChanged<String> onDepartureSubmitted;
  final ValueChanged<String> onArrivalSubmitted;
  final Color? fillColor;

  const SearchTripHorizontal({
    required this.departureUniqueKey,
    required this.arrivalUniqueKey,
    required this.firstItems,
    required this.secondItems,
    required this.arrivalController,
    required this.departureController,
    required this.onSwapButtonTap,
    required this.onArrivalSubmitted,
    required this.onDepartureSubmitted,
    this.departureFocusNode,
    this.arrivalFocusNode,
    this.fillColor,
    super.key,
  });

  void _onSwap() {
    final temp = departureController.text;

    departureController.text = arrivalController.text;
    arrivalController.text = temp;

    onSwapButtonTap();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: SearchableMenu(
                key: departureUniqueKey,
                focusNode: departureFocusNode,
                controller: departureController,
                onSubmitted: onDepartureSubmitted,
                items: firstItems,
                hintText: context.locale.from,
                fillColor: fillColor,
              ),
            ),
            const SizedBox(width: CommonDimensions.large),
            Expanded(
              child: SearchableMenu(
                key: arrivalUniqueKey,
                focusNode: arrivalFocusNode,
                controller: arrivalController,
                onSubmitted: onArrivalSubmitted,
                items: secondItems,
                hintText: context.locale.to,
                fillColor: fillColor,
              ),
            ),
          ],
        ),
        Align(
          child: Padding(
            padding:
                const EdgeInsets.only(top: CommonDimensions.extraSmall + 1),
            child: FloatingActionButton.small(
              backgroundColor: context.theme.containerBackgroundColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(CommonDimensions.extraLarge),
                ),
              ),
              onPressed: _onSwap,
              child: const AvtovasVectorImage(
                svgAssetPath: ImagesAssets.horizontalSwapIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
