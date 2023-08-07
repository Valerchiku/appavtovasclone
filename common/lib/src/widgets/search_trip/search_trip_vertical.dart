import 'package:common/avtovas_common_localization.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
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
  final ValueChanged<String>? onChangedArrival;
  final ValueChanged<String>? onChangedDeparture;
  final ValueChanged<String>? onDepartureSubmitted;
  final ValueChanged<String>? onArrivalSubmitted;
  final VoidCallback onSwapButtonTap;

  const SearchTripVertical({
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
              focusNode: departureFocusNode,
              controller: departureController,
              onSubmitted: onDepartureSubmitted,
              items: items,
              onChanged: onChangedDeparture,
              hintText: context.locale.from,
            ),
            const SizedBox(height: CommonDimensions.large),
            SearchableMenu(
              focusNode: arrivalFocusNode,
              controller: arrivalController,
              onSubmitted: onArrivalSubmitted,
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
