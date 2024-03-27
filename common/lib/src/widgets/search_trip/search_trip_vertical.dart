import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTripVertical extends StatelessWidget {
  final UniqueKey? departureUniqueKey;
  final UniqueKey? arrivalUniqueKey;
  final List<String>? firstItems;
  final List<String>? secondItems;
  final FocusNode? departureFocusNode;
  final FocusNode? arrivalFocusNode;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<String>? onChangedArrival;
  final ValueChanged<String>? onChangedDeparture;
  final ValueChanged<String>? onDepartureSubmitted;
  final ValueChanged<String>? onArrivalSubmitted;
  final VoidCallback onSwapButtonTap;
  final Color? fillColor;

  const SearchTripVertical({
    required this.firstItems,
    required this.secondItems,
    required this.arrivalController,
    required this.departureController,
    required this.onSwapButtonTap,
    this.onDepartureSubmitted,
    this.onArrivalSubmitted,
    this.onChangedArrival,
    this.onChangedDeparture,
    this.departureFocusNode,
    this.arrivalFocusNode,
    this.fillColor,
    this.departureUniqueKey,
    this.arrivalUniqueKey,
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
      alignment: Alignment.centerRight,
      children: [
        Column(
          children: [
            SearchableMenu(
              key: departureUniqueKey,
              controller: departureController,
              items: firstItems,
              onSubmitted: (value) {
                onDepartureSubmitted?.call(value);
                departureFocusNode?.nextFocus();
              },
              focusNode: departureFocusNode,
              onChanged: onChangedDeparture,
              hintText: context.locale.from,
              fillColor: fillColor,
            ),
            const SizedBox(height: CommonDimensions.large),
            SearchableMenu(
              key: arrivalUniqueKey,
              controller: arrivalController,
              items: secondItems,
              onSubmitted: onArrivalSubmitted,
              focusNode: arrivalFocusNode,
              onChanged: onChangedArrival,
              hintText: context.locale.to,
              fillColor: fillColor,
            ),
          ],
        ),
        FloatingActionButton.small(
          backgroundColor: context.theme.containerBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(CommonDimensions.extraLarge),
            ),
          ),
          onPressed: _onSwap,
          child: const AvtovasVectorImage(
            svgAssetPath: ImagesAssets.swapIcon,
          ),
        ),
      ],
    );
  }
}
