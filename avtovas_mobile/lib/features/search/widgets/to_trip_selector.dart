import 'package:avtovas_mobile/features/search/utils/constants/colors.dart';
import 'package:avtovas_mobile/features/search/utils/constants/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToTripSelectorWidget extends StatefulWidget {
  final routes;

  const ToTripSelectorWidget({super.key, required this.routes});

  @override
  State<ToTripSelectorWidget> createState() => _ToTripSelectorWidgetState();
}

class _ToTripSelectorWidgetState extends State<ToTripSelectorWidget> {
  String val = 'Ардатов';

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
