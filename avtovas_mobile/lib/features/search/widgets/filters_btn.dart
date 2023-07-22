import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/src/utils/constants/images_assets.dart';
import 'package:common/src/theme/app_themes.dart';

class DateFilterBtnWidget extends StatelessWidget {
  final Function()? showPicker;

  DateFilterBtnWidget({super.key, required this.showPicker});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: AvtovasBtnStyle(),
        onPressed: showPicker,
        child: Row(children: [
          AvtovasVectorImage(svgAssetPath: ImagesAssets.datePickerIcon),
          Container(
            margin: EdgeInsets.only(left: Dimensions.dateBtnLabelMarginLeft),
            child: Text(context.locale.date),
          )
        ]));
  }
}
