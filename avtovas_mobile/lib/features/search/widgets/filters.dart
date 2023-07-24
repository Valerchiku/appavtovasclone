import 'package:common/avtovas_common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/constants/dimensions.dart';
import 'filters_btn.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.dateFilterMarginTop),
      child: Row(children: [
        DateFilterBtnWidget(showPicker: () {
          // TODO(gleb_dyakov): implementation.
          AvtovasDatepickerUtils.showAutovasDatePicker(context: context);
        },)
      ],),
    );
  }
}
