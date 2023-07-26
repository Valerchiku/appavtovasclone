import 'package:common/avtovas_common.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:common/src/utils/constants/common_dimensions.dart';
import 'package:flutter/material.dart';

class FromTripSelectorWidget extends StatelessWidget {
  final List<String> routes;
  final val = 'Алатырь';

  const FromTripSelectorWidget({required this.routes, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: context.theme.selectorBackground,
            borderRadius: CommonDimensions.selectorBorderRadius,),
        padding: const EdgeInsets.only(
            left: CommonDimensions.selectorPaddingLeft,
            top: CommonDimensions.selectorPaddingVertical,
            bottom: CommonDimensions.selectorPaddingVertical,),
        width: context.availableWidth,
        height: CommonDimensions.selectorHeight,
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
