import 'package:avtovas_mobile/src/features/help_info/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/help_info/utils/constants/colors.dart'
  as help_info_colors;
import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final String content;
  final Function onSelected;

  const Item(
      {required this.title,
      required this.content,
      required this.onSelected,
      super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.itemMarginTop),
      child: Column(children: [
        ExpansionTile(
            shape: const Border(),
            onExpansionChanged: (val) {
              onSelected();
            },
            trailing: AvtovasVectorImage(svgAssetPath: ImagesAssets.closedItem),
            title: Text(title),
            children: <Widget>[Text(content)],),
        const Divider(
          color: help_info_colors.Colors.divider,
        )
      ],),
    );
  }
}
