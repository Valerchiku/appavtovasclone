import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/constants/dimensions.dart';
import 'package:avtovas_mobile/src/features/passengers/utils/constants/colors.dart'
as HelpInfoColors;

class Item extends StatelessWidget {
  final String title;
  final String content;
  final Function onSelected;

  const Item(
      {required this.title,
        required this.content,
        required this.onSelected,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.itemMarginTop),
      child: Column(children: [
        ExpansionTile(
            shape: Border(),
            onExpansionChanged: (val) {
              onSelected();
            },
            trailing: AvtovasVectorImage(svgAssetPath: ImagesAssets.closedItem),
            title: Text(title),
            children: <Widget>[Text(content)],
            initiallyExpanded: false),
        Divider(
          color: HelpInfoColors.Colors.divider,
        )
      ]),
    );
  }
}