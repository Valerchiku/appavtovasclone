import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';

class ClearRecentTripsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.clearHistoryLabelMarginTop),
      child: Text(context.locale.clear_history,
          style: TextStyle(color: SearchColors.clearHistoryColor)),
    );
  }
}
