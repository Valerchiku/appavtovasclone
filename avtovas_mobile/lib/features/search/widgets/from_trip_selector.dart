import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';

class FromTripSelectorWidget extends StatefulWidget {
  final routes;

  const FromTripSelectorWidget({super.key, required this.routes});

  @override
  State<FromTripSelectorWidget> createState() => _FromTripSelectorWidgetState();
}

class _FromTripSelectorWidgetState extends State<FromTripSelectorWidget> {
  String val = 'Алатырь';

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: SearchColors.selectorBackground,
            borderRadius: BorderRadius.circular(Dimensions.selectorRadius)),
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
            items: widget.routes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()),
        width: Dimensions.selectorWidth,
        height: Dimensions.selectorHeight);
  }
}
