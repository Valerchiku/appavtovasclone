import 'package:avtovas_mobile/src/common/constants/app_assets.dart';
import 'package:avtovas_mobile/src/common/constants/app_dimensions.dart';
import 'package:common/avtovas_common_themes.dart';
import 'package:common/avtovas_common_widgets.dart';
import 'package:flutter/material.dart';

class BottomSheetList extends StatelessWidget {
  final String orderNumber;
  final List<PageOptionTile> children;
  const BottomSheetList({
    required this.orderNumber,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      shrinkWrap: true,
      children: [
        _BottomSheetListHeader(orderNumber: orderNumber),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ],
    );
  }
}

class _BottomSheetListHeader extends StatelessWidget {
  final String orderNumber;
  const _BottomSheetListHeader({required this.orderNumber});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      title: Text(
        orderNumber,
        style: context.themeData.textTheme.displaySmall,
      ),
      trailing: AvtovasVectorButton(
        svgAssetPath: AppAssets.crossIcon,
        // Потом заменим на нужную вещь
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
