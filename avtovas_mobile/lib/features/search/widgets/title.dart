import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.locale.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: context.theme.titleColor, fontSize: CommonDimensions.titleSize,),);
  }
}
