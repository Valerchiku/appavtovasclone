import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClearRecentTripsWidget extends StatelessWidget {
  const ClearRecentTripsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.clearHistoryLabelMarginTop),
      child: Text(context.locale.clear_history,
          style: const TextStyle(color: SearchColors.clearHistoryColor),),
    );
  }
}
