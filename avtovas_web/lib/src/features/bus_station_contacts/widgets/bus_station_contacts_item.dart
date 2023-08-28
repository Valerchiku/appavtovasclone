import 'dart:js_util';

import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/app_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BusStationContactsItem extends StatelessWidget {
  final String title;
  final String address;
  final String phone;

  const BusStationContactsItem({
    required this.title,
    required this.address,
    required this.phone,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppDimensions.large),
        Text(
          title,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.mainAppColor,
            fontSize: AppFonts.titleSize,
          ),
        ),
        Text(
          address,
          style: TextStyle(
            color: context.theme.secondaryTextColor,
            fontSize: AppFonts.titleSize,
            fontWeight: AppFonts.normalWeight,
          ),
        ),
        Text(
          phone,
          style: TextStyle(
            color: context.theme.secondaryTextColor,
            fontSize: AppFonts.titleSize,
            fontWeight: AppFonts.normalWeight,
          ),
        ),
        const SizedBox(height: AppDimensions.large),
      ],
    );
  }
}
