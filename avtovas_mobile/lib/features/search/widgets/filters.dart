import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'filters_btn.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: CommonDimensions.dateFilterMarginTop),
      child: Row(children: [
        DateFilterBtnWidget(showPicker: () {
          // TODO(gleb_dyakov): implementation.
          AvtovasDatepickerUtils.showAutovasDatePicker(context: context);
        },)
      ],),
    );
  }
}
