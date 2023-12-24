import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTripVertical extends StatelessWidget {
  final UniqueKey departureUniqueKey;
  final UniqueKey arriavalUniqueKey;
  final List<String>? items;
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
    required this.departureUniqueKey,
    required this.arriavalUniqueKey,
    required this.items,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchableMenu(
              key: departureUniqueKey,
              controller: departureController,
              items: items,
              onSubmitted: onDepartureSubmitted,
              onChanged: onChangedDeparture,
              hintText: context.locale.from,
              fillColor: fillColor,
            ),
            const SizedBox(height: CommonDimensions.large),
            SearchableMenu(
              key: arriavalUniqueKey,
              controller: arrivalController,
              items: items,
              onSubmitted: onArrivalSubmitted,
              onChanged: onChangedArrival,
              hintText: context.locale.to,
              fillColor: fillColor,
            ),
          ],
        ),
        Positioned(
          top: 40,
          right: 0,
          child: FloatingActionButton.small(
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
        ),
      ],
    );
  }
}
