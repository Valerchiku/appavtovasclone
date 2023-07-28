import 'package:common/avtovas_common.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/common_dimensions.dart';
// ignore: implementation_imports
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String content;
  final Function() onSelected;

  const Item(
      {required this.title,
      required this.content,
      required this.onSelected,
      super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CommonDimensions.itemMarginTop),
      child: Column(children: [
        ExpansionTile(
            shape: const Border(),
            onExpansionChanged: (val) {
              onSelected();
            },
            trailing: const AvtovasVectorImage(svgAssetPath: ImagesAssets.closedItem),
            title: Text(title),
            children: <Widget>[Text(content)],),
        const Divider(
          color: context.theme.divider,
        )
      ],),
    );
  }
}
