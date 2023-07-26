import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateFilterBtnWidget extends StatelessWidget {
  final Function()? showPicker;

  const DateFilterBtnWidget({required this.showPicker, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: AvtovasBtnStyle(),
        onPressed: showPicker,
        child: Row(children: [
          const AvtovasVectorImage(svgAssetPath: ImagesAssets.datePickerIcon),
          Container(
            margin: const EdgeInsets.only(left: CommonDimensions.dateBtnLabelMarginLeft),
            child: Text(context.locale.date),
          )
        ],),);
  }
}
