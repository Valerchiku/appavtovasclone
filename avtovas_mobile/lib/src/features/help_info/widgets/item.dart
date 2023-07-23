import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/src/features/help_info/utils/constants/colors.dart'
    as HelpInfoColors;

class Item extends StatelessWidget {
  final String title;
  final String content;
  final Function onSelected;

  const Item({required this.title, required this.content, required this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        onExpansionChanged: (val) {
          onSelected();
        },
        trailing: Icon(
          Icons.chevron_right,
          color: HelpInfoColors.Colors.itemIcon,
        ),
        title: Text(title),
        children: <Widget>[Text(content)],
        initiallyExpanded: true);
  }
}
