import 'package:avtovas_web/src/common/constants/app_dimensions.dart';
import 'package:avtovas_web/src/common/constants/web_fonts.dart';
import 'package:common/avtovas_common.dart';
import 'package:flutter/material.dart';

class BusStationContactsBody extends StatelessWidget {
  final bool smartLayout;
  final bool mobileLayout;
  final List<MockContact> contacts;

  const BusStationContactsBody({
    required this.smartLayout,
    required this.mobileLayout,
    required this.contacts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        smartLayout ? AppDimensions.large : AppDimensions.extraLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Контакты автовокзалов',
            style: context.themeData.textTheme.displayMedium,
          ),
          Text(
            'it@avtovas.com',
            style: TextStyle(
              color: context.theme.mainAppColor,
              fontSize: WebFonts.titleFont,
              fontWeight: WebFonts.weightRegular,
            ),
          ),
        ],
      ),
    );
  }
}
