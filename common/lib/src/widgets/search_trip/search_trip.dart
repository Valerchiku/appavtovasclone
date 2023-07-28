import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/widgets/searchable_menu/searchable_menu.dart';
import 'package:flutter/material.dart';

class SearchTrip extends StatefulWidget {
  final List<String> items;
  final TextEditingController arrivalController;
  final TextEditingController departureController;
  final ValueChanged onChangedArrival;
  final ValueChanged onChangedDeparture;
  final String? arrivalHint;
  final String? departureHint;
  const SearchTrip({
    required this.items,
    required this.arrivalController,
    required this.departureController,
    required this.onChangedArrival,
    required this.onChangedDeparture,
    this.arrivalHint,
    this.departureHint,
    super.key,
  });

  @override
  State<SearchTrip> createState() => _SearchTripState();
}

class _SearchTripState extends State<SearchTrip> {
  void _swapDropdownValues() {
    final temp = widget.departureController.text;
    setState(() {
      widget.departureController.text = widget.arrivalController.text;
      widget.arrivalController.text = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmart =
            constraints.maxWidth <= CommonDimensions.maxNonSmartWidth;
        final isWeb = AvtovasPlatform.isWeb;
        return SizedBox(
          child: Stack(
            children: [
              if (isSmart)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SearchableMenu(
                      controller: widget.arrivalController,
                      items: widget.items,
                      onChanged: widget.onChangedArrival,
                      hintText: widget.arrivalHint,
                    ),
                    const SizedBox(height: CommonDimensions.large),
                    SearchableMenu(
                      controller: widget.departureController,
                      items: widget.items,
                      onChanged: widget.onChangedDeparture,
                      hintText: widget.departureHint,
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(
                      child: SearchableMenu(
                        controller: widget.arrivalController,
                        items: widget.items,
                        onChanged: widget.onChangedArrival,
                        hintText: widget.arrivalHint,
                      ),
                    ),
                    const SizedBox(width: CommonDimensions.large),
                    Expanded(
                      child: SearchableMenu(
                        controller: widget.departureController,
                        items: widget.items,
                        onChanged: widget.onChangedDeparture,
                        hintText: widget.departureHint,
                      ),
                    ),
                  ],
                ),
              Align(
                heightFactor: isSmart
                    ? CommonDimensions.mobileHeightFactor
                    : CommonDimensions.webHeightFactor,
                alignment: isSmart ? Alignment.centerRight : Alignment.center,
                child: FloatingActionButton.small(
                  backgroundColor: context.theme.whitespaceContainerColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(CommonDimensions.extraLarge),
                    ),
                  ),
                  onPressed: _swapDropdownValues,
                  child: AvtovasVectorImage(
                    svgAssetPath: isWeb
                        ? ImagesAssets.horizontalSwapIcon
                        : ImagesAssets.swapIcon,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
