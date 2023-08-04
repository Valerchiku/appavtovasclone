import 'package:common/avtovas_common.dart';

// ignore: implementation_imports
import 'package:common/src/utils/constants/common_dimensions.dart';

// ignore: implementation_imports
import 'package:flutter/material.dart';

class HelpInfoItem extends StatelessWidget {
  final String title;
  final String content;
  final Function() onSelected;

  const HelpInfoItem({
    required this.title,
    required this.content,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: CommonDimensions.itemMarginTop,
      ),
      child: Column(
        children: [
          ExpansionContainer(
            title: Text(title),
            children: <Widget>[Text(content)],
            arrowAlignment: ArrowAlignment.end,
          ),
        ],
      ),
    );
  }
}
