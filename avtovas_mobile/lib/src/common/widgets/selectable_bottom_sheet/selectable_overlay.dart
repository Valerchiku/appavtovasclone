import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:avtovas_mobile/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class SelectableOverlay<T> extends StatefulWidget {
  final List<SelectableOverlayItem<T>> items;
  final bool withCloseButton;
  final bool withSearchField;

  const SelectableOverlay({
    required this.items,
    this.withCloseButton = false,
    this.withSearchField = false,
    super.key,
  });

  @override
  State<SelectableOverlay<T>> createState() => _SelectableOverlayState<T>();
}

class _SelectableOverlayState<T> extends State<SelectableOverlay<T>> {
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final overlayBody = Column(
      children: [
        Row(
          children: [
            if (widget.withSearchField && widget.items.length > 10)
              Expanded(
                child: InputField(
                  onChanged: (value) => setState(
                    () => _searchQuery = value,
                  ),
                  inputDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(
                      AppDimensions.medium,
                    ),
                    border: const OutlineInputBorder(),
                    hintText: context.locale.search,
                  ),
                ),
              ),
            if (!widget.withSearchField)
              const Spacer()
            else
              const SizedBox(width: AppDimensions.mediumLarge),
            if (widget.withCloseButton)
              AvtovasVectorButton(
                onTap: () => Navigator.canPop(context)
                    ? Navigator.pop(context)
                    : throw Exception(
                        'This action is related to the Navigator, '
                        'the window must use any overlay to display '
                        'and have a path in the navigator context.',
                      ),
                svgAssetPath: AppAssets.crossIcon,
              ),
          ],
        ),
        if (widget.items.length > 10)
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: _searchQuery.isEmpty
                  ? widget.items.length
                  : widget.items
                      .where(
                        (item) => item.itemLabel
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()),
                      )
                      .length,
              itemBuilder: (_, index) {
                return _searchQuery.isEmpty
                    ? widget.items[index]
                    : widget.items
                        .where(
                          (item) => item.itemLabel
                              .toLowerCase()
                              .contains(_searchQuery.toLowerCase()),
                        )
                        .toList()[index];
              },
            ),
          )
        else
          for (final item in widget.items) item,
        const SizedBox(height: AppDimensions.medium),
      ],
    );

    return widget.items.length > 10
        ? Expanded(child: overlayBody)
        : overlayBody;
  }
}

final class SelectableOverlayItem<T> extends StatelessWidget {
  final ValueChanged<T> onItemChanged;
  final String itemLabel;
  final T item;
  final T selectedItem;

  const SelectableOverlayItem({
    required this.onItemChanged,
    required this.itemLabel,
    required this.item,
    required this.selectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.transparent,
      child: InkWell(
        onTap: () {
          onItemChanged(item);
          Navigator.canPop(context)
              ? Navigator.pop(context)
              : throw Exception(
                  'This action is related to the Navigator, '
                  'the window must use any overlay to display '
                  'and have a path in the navigator context.',
                );
        },
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimensions.medium),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.large),
          child: Row(
            children: [
              Text(
                itemLabel,
                style: context.themeData.textTheme.titleLarge?.copyWith(
                  fontSize: AppFonts.sizeHeadlineMedium,
                ),
              ),
              const Spacer(),
              AvtovasCheckbox(
                onChanged: (_) => onItemChanged(item),
                value: item == selectedItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
