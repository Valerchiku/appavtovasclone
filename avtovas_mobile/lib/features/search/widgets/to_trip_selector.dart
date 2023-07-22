import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToTripSelectorWidget extends StatelessWidget {
  final List<String> routes;
  final val = 'Ардатов';
  ToTripSelectorWidget({required this.routes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.selectorMarginTop),
      decoration: BoxDecoration(
          color: SearchColors.selectorBackground,
          borderRadius: BorderRadius.circular(Dimensions.selectorRadius)),
      padding: EdgeInsets.only(
          left: Dimensions.selectorPaddingLeft,
          top: Dimensions.selectorPaddingVertical,
          bottom: Dimensions.selectorPaddingVertical),
      width: Dimensions.selectorWidth,
      height: Dimensions.selectorHeight,
      child: DropdownButton<String>(
          value: val,
          icon: const Icon(null),
          isExpanded: true,
          underline: Container(),
          onChanged: (String? newValue) {
            // TODO
          },
          items: routes
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ))
              .toList()),
    );
  }
}
