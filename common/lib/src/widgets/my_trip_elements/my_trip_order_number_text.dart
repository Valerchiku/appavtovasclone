import 'package:common/avtovas_common_themes.dart';
import 'package:common/src/utils/constants/common_fonts.dart';
import 'package:flutter/material.dart';

class MyTripOrderNumberText extends StatelessWidget {
  final String orderNumber;
  const MyTripOrderNumberText({
    required this.orderNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      orderNumber,
      style: context.themeData.textTheme.headlineMedium?.copyWith(
        fontWeight: CommonFonts.weightRegular,
      ),
    );
  }
}
