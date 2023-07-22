import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants/dimensions.dart';
import 'filters_btn.dart';

class FiltersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.dateFilterMarginTop),
      child: Row(children: [
        DateFilterBtnWidget(showPicker: () {
          // TODO
          AvtovasDatepickerUtils.showAutovasDatePicker(context: context);
        })
      ]),
    );
  }
}
