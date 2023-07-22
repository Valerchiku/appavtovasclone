import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';

class FromTripSelectorWidget extends StatelessWidget {
  final List<String> routes;
  final val = 'Алатырь';

  FromTripSelectorWidget({required this.routes});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: SearchColors.selectorBackground,
            borderRadius: Dimensions.selectorBorderRadius),
        padding: EdgeInsets.only(
            left: Dimensions.selectorPaddingLeft,
            top: Dimensions.selectorPaddingVertical,
            bottom: Dimensions.selectorPaddingVertical),
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
        width: Dimensions.selectorWidth,
        height: Dimensions.selectorHeight);
  }
}
