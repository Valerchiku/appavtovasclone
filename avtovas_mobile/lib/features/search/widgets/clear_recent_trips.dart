import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearRecentTripsWidget extends StatelessWidget {
  const ClearRecentTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: CommonDimensions.clearHistoryLabelMarginTop),
      child: Text(context.locale.clearHistory,
          style: TextStyle(color: context.theme.clearHistoryColor),),
    );
  }
}
