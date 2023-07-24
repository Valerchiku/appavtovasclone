import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

class ToTripSelectorWidget extends StatelessWidget {
  final List<String> routes;
  final val = 'Ардатов';

  const ToTripSelectorWidget({required this.routes, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.selectorMarginTop),
      decoration: BoxDecoration(
          color: SearchColors.selectorBackground,
          borderRadius: BorderRadius.circular(Dimensions.selectorRadius),),
      padding: const EdgeInsets.only(
          left: Dimensions.selectorPaddingLeft,
          top: Dimensions.selectorPaddingVertical,
          bottom: Dimensions.selectorPaddingVertical,),
      width: context.availableWidth,
      height: Dimensions.selectorHeight,
      child: DropdownButton<String>(
          value: val,
          icon: const Icon(null),
          isExpanded: true,
          underline: Container(),
          onChanged: (String? newValue) {
            // TODO(gleb_dyakov): implementation.
          },
          items: routes
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),)
              .toList(),),
    );
  }
}
