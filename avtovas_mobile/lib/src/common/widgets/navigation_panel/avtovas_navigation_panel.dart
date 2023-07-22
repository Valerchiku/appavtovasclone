import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

final class AvtovasNavigationPanel extends StatelessWidget {
  final int selectedIndex;
  final List<AvtovasNavigationItem> items;
  final ValueChanged<int>? onIndexChanged;

  const AvtovasNavigationPanel({
    required this.selectedIndex,
    required this.items,
    this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const elevation = 10.0;

    return Material(
      elevation: elevation,
      color: context.theme.whitespaceContainerColor,
      child: SizedBox(
        height: AppDimensions.navigationPanelHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.extraLarge,
            vertical: AppDimensions.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var index = 0; index < items.length; index++)
                _AvtovasNavigationItem(
                  itemIndex: index,
                  selectedIndex: selectedIndex,
                  navigationItem: items[index],
                  onIndexChanged: onIndexChanged,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _AvtovasNavigationItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final AvtovasNavigationItem navigationItem;
  final ValueChanged<int>? onIndexChanged;

  const _AvtovasNavigationItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.navigationItem,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    const selectedIconScale = 1.4;
    const unselectedIconScale = 1.0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onIndexChanged?.call(itemIndex),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.medium),
        child: Column(
          children: [
            AnimatedScale(
              scale: itemIndex == selectedIndex
                  ? selectedIconScale
                  : unselectedIconScale,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              child: AvtovasVectorImage(
                width: AppDimensions.navigationPanelIconSize,
                height: AppDimensions.navigationPanelIconSize,
                svgAssetPath: navigationItem.iconPath,
              ),
            ),
            const SizedBox(height: AppDimensions.medium),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: context.themeData.textTheme.bodyLarge!.copyWith(
                color: context.theme.primaryTextColor,
                fontWeight: itemIndex == selectedIndex ? FontWeight.bold : null,
              ),
              child: Text(
                navigationItem.label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class AvtovasNavigationItem {
  final String iconPath;
  final String label;

  const AvtovasNavigationItem({
    required this.iconPath,
    required this.label,
  });
}
