import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTripVertical<T> extends StatelessWidget {
  final List<Widget> items;
  final FocusNode? departureFocusNode;
  final FocusNode? arrivalFocusNode;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged<T>? onChangedArrival;
  final ValueChanged<T>? onChangedDeparture;
  final bool Function(Widget, String) onDepartureSearchChanged;
  final bool Function(Widget, String) onArrivalSearchChanged;
  final VoidCallback onSwapButtonTap;

  const SearchTripVertical({
    required this.items,
    required this.arrivalController,
    required this.departureController,
    required this.onSwapButtonTap,
    required this.onDepartureSearchChanged,
    required this.onArrivalSearchChanged,
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
            SuggestionField(
              controller: departureController,
              suggestions: items,
              onSearch: onDepartureSearchChanged,
              hintText: context.locale.from,
            ),
            const SizedBox(height: CommonDimensions.large),
            SuggestionField(
              controller: arrivalController,
              suggestions: items,
              onSearch: onArrivalSearchChanged,
              hintText: context.locale.from,
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
